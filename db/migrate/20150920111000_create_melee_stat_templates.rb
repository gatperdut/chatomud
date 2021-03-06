class CreateMeleeStatTemplates < ActiveRecord::Migration[6.1]

  def change
    create_table :melee_stat_templates do |t|
      t.references :weapon_stat_template, index: true

      t.string :sheathed_desc
    end

    add_foreign_key :melee_stat_templates, :weapon_stat_templates, on_delete: :cascade
  end

end
