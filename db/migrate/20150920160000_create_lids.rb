class CreateLids < ActiveRecord::Migration[6.1]

  def change
    create_table :lids do |t|
      t.boolean :open, null: false, default: false

      t.references :inventory, null: false, index: true
    end

    add_foreign_key :lids, :inventories, on_delete: :cascade
  end

end
