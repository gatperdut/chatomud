class CreateWritings < ActiveRecord::Migration[6.1]

  def change
    create_table :writings do |t|
      t.references :item, null: false, index: true
      t.boolean :wipeable, null: false, default: false
    end

    add_foreign_key :writings, :items, on_delete: :cascade
  end

end
