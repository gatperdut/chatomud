class CreateBoards < ActiveRecord::Migration[6.1]

  def change
    create_table :boards do |t|
      t.references :item, null: false, index: true
    end

    add_foreign_key :boards, :items, on_delete: :cascade
  end

end
