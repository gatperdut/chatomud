class CreateCraftIngredients < ActiveRecord::Migration[6.1]

  def change
    create_table :craft_ingredients do |t|
      t.references :craft, null: false, index: true
      t.text :item_template_codes, null: false
      t.integer :location,   null: false, default: 0
      t.integer :usage_type, null: false, default: 0
      t.integer :how_many,   null: false, default: 1
    end

    add_foreign_key :craft_ingredients, :crafts, on_delete: :cascade
  end

end
