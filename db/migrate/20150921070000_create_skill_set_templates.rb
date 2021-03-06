class CreateSkillSetTemplates < ActiveRecord::Migration[6.1]

  def change
    create_table :skill_set_templates do |t|
      t.references :character_template, null: false, index: true

      t.string :chosen, null: false, array: true, default: [].to_yaml
    end

    add_foreign_key :skill_set_templates, :character_templates, on_delete: :cascade
  end

end
