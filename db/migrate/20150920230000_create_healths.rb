class CreateHealths < ActiveRecord::Migration[6.1]

  def change
    create_table :healths do |t|
      t.references :character, null: false, index: true

      t.integer :exhaustion, null: false, default: 0
    end

    add_foreign_key :healths, :characters, on_delete: :cascade
  end

end
