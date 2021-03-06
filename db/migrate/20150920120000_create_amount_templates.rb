class CreateAmountTemplates < ActiveRecord::Migration[6.1]

  def change
    create_table :amount_templates do |t|
      t.integer :current, null: false

      t.integer :max,     null: false

      t.references :stackable, null: true, index: true

      t.references :edible,    null: true, index: true

      t.references :fillable,  null: true, index: true

      t.references :fuelable,  null: true, index: true
    end

    add_foreign_key :amount_templates, :item_templates,         on_delete: :cascade, column: :stackable_id
    add_foreign_key :amount_templates, :item_templates,         on_delete: :cascade, column: :edible_id
    add_foreign_key :amount_templates, :item_templates,         on_delete: :cascade, column: :fillable_id

    add_foreign_key :amount_templates, :light_source_templates, on_delete: :cascade, column: :fuelable_id
  end

end
