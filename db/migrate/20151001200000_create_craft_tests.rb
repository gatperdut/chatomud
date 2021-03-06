class CreateCraftTests < ActiveRecord::Migration[6.1]

  def change
    create_table :craft_tests do |t|
      t.references :craft_step, null: false, index: true

      t.integer :skill, null: false, default: 0

      t.integer :modifier, null: false
    end

    add_foreign_key :craft_tests, :craft_steps, on_delete: :cascade
  end

end
