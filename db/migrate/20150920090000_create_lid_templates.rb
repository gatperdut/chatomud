class CreateLidTemplates < ActiveRecord::Migration[6.1]

  def change
    create_table :lid_templates do |t|
      t.references :inventory_template, null: false, index: true
    end

    add_foreign_key :lid_templates, :inventory_templates, on_delete: :cascade
  end

end
