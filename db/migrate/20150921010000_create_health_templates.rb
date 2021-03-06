class CreateHealthTemplates < ActiveRecord::Migration[6.1]

  def change
    create_table :health_templates do |t|
      t.references :character_template, null: false, index: true
    end

    add_foreign_key :health_templates, :character_templates, on_delete: :cascade
  end

end
