class CreateAmountData < ActiveRecord::Migration[6.1]

  def change
    create_table :amount_data do |t|

      t.references :amount, null: false, index: true

      t.integer :fluid, null: true

      t.integer :calories, null: true # Per bite/sip.

      t.integer :hydration, null: true # In milliliters, per bite/sip.

    end

  end

end
