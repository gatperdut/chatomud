class CreateNourishments < ActiveRecord::Migration[6.1]

  def change
    create_table :nourishments do |t|
      t.references :character, null: false, index: true

      t.integer :calories, null: false, default: 0 # Should cap at maximum requirement per day (based on race and gender).
      t.integer :hydration, null: false, default: 0 # In milliliters.
    end

    add_foreign_key :nourishments, :characters, on_delete: :cascade
  end

end
