class CreateAmounts < ActiveRecord::Migration[6.1]

  def change
    create_table :amounts do |t|
      t.integer :current, null: false
      t.integer :max, null: false
      t.references :stackable, null: true, index: true
      t.references :edible,    null: true, index: true
      t.references :fillable,  null: true, index: true
      t.references :fuelable,  null: true, index: true
    end

    add_foreign_key :amounts, :items,         on_delete: :cascade, column: :stackable_id
    add_foreign_key :amounts, :items,         on_delete: :cascade, column: :edible_id
    add_foreign_key :amounts, :items,         on_delete: :cascade, column: :fillable_id
    add_foreign_key :amounts, :light_sources, on_delete: :cascade, column: :fuelable_id
  end

end
