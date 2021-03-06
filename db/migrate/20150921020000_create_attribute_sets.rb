class CreateAttributeSets < ActiveRecord::Migration[6.1]

  def change
    create_table :attribute_sets do |t|
      t.references :character, null: false, index: true

      t.integer :str, null: false, default: 1
      t.integer :con, null: false, default: 1
      t.integer :agi, null: false, default: 1
      t.integer :dex, null: false, default: 1
      t.integer :int, null: false, default: 1
      t.integer :wil, null: false, default: 1
      t.integer :pow, null: false, default: 1
    end

    add_foreign_key :attribute_sets, :characters, on_delete: :cascade
  end

end
