class CreateItems < ActiveRecord::Migration[6.1]

  def change
    create_table :items do |t|
      t.string :short_desc, null: false
      t.string :long_desc,  null: false
      t.text   :full_desc,  null: false
      t.string :kwords, null: false, array: true, default: [].to_yaml

      t.string :possible_slots, null: false, array: true, default: [].to_yaml
      t.integer :slot, null: false, default: 0

      t.integer :weight, null: false, default: 0 # In grams.

      t.boolean :is_sheath, default: false, null: false
      t.boolean :is_quiver, default: false, null: false

      t.references :containing_inventory, null: false, index: true

      t.references :item_template, null: false, index: true
    end

    add_foreign_key :items, :inventories, column: :containing_inventory_id, on_delete: :cascade
    add_foreign_key :items, :item_templates, column: :item_template_id, on_delete: :cascade

    add_foreign_key :weapon_stats, :items, on_delete: :cascade
    add_foreign_key :missile_stats, :items, on_delete: :cascade
  end

end
