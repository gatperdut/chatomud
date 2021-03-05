class CreateLidTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :lid_templates do |t|
      t.references :inventory_template, null: false, index: true
    end
  end
end
