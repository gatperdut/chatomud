class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.references :parent, null: false, index: true, polymorphic: true
    end
  end
end
