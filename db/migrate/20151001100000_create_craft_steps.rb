class CreateCraftSteps < ActiveRecord::Migration[6.1]

  def change
    create_table :craft_steps do |t|
      t.references :craft, null: false, index: true

      t.string :echo_first, null: false
      t.string :echo_third, null: false

      t.string :fail_first
      t.string :fail_third

      t.integer :delay, null: false
    end

    add_foreign_key :craft_steps, :crafts, on_delete: :cascade
  end

end
