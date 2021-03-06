class CreatePhysicalAttrs < ActiveRecord::Migration[6.1]

  def change
    create_table :physical_attrs do |t|
      t.references :character, index: true

      t.integer :gender, null: false, default: 0
      t.integer :race, null: false, default: 0
      t.integer :height, null: false, default: 0 # In centimeters.
      t.integer :weight, null: false, default: 0 # In kilograms.
    end

    add_foreign_key :physical_attrs, :characters, on_delete: :cascade
  end

end
