class CreateItemTemplatesSolidFuelReqs < ActiveRecord::Migration[6.1]

  def change
    create_table :item_templates_solid_fuel_reqs, id: false do |t|
      t.references :item_template,  null: false, index: true
      t.references :solid_fuel_req, null: false, index: true
    end

    add_foreign_key :item_templates_solid_fuel_reqs, :solid_fuel_reqs, on_delete: :cascade
    add_foreign_key :item_templates_solid_fuel_reqs, :item_templates,  on_delete: :cascade
  end

end
