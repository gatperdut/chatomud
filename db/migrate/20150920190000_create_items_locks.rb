class CreateItemsLocks < ActiveRecord::Migration[6.1]

  def change
    create_table :items_locks, id: false do |t|
      t.references :item, null: false, index: true
      t.references :lock, null: false, index: true
    end

    add_foreign_key :items_locks, :items, on_delete: :cascade
    add_foreign_key :items_locks, :locks, on_delete: :cascade
  end

end
