class CreateBooks < ActiveRecord::Migration[6.1]

  def change
    create_table :books do |t|
      t.references :item,          null: false, index: true
      t.integer    :page_count,    null: false, default: 10
      t.integer    :current_page,  null: true,  default: nil
    end

    add_foreign_key :books, :items, on_delete: :cascade
  end

end
