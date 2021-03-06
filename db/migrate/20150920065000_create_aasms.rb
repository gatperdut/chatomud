class CreateAasms < ActiveRecord::Migration[6.1]

  def change
    create_table :aasms do |t|
      t.integer :code, null: false, default: 0

      t.references :character, index: true

      t.boolean :active, null: false, default: true
    end

    add_foreign_key :aasms, :characters, on_delete: :cascade
  end

end
