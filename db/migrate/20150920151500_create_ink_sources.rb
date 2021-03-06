class CreateInkSources < ActiveRecord::Migration[6.1]

  def change
    create_table :ink_sources do |t|
      t.references :item, null: false, index: true
      t.integer :ink_type, null: false, default: 0
      t.integer :charges, null: false, default: 0
      t.references :spawned_item_template, null: true, index: true
    end

    add_foreign_key :ink_sources, :items, on_delete: :cascade
  end

end
