class CreateRangedStatTemplates < ActiveRecord::Migration[6.1]

  def change
    create_table :ranged_stat_templates do |t|
      t.references :weapon_stat_template, index: true
      t.integer :missile_type, null: false, default: 0
      t.string :ranges_suitability, null: false, array: true, default: [].to_yaml
      t.boolean :can_remain_loaded, default: false, null: false
    end

    add_foreign_key :ranged_stat_templates, :weapon_stat_templates, on_delete: :cascade
  end

end
