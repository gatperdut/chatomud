class CreateWeaponStatTemplates < ActiveRecord::Migration[6.1]

  def change
    create_table :weapon_stat_templates do |t|
      t.references :item_template, null: false, index: true
      t.integer :grip, null: false, default: 0
      t.integer :roll_mod, null: false, default: 0     # added to attack rolls   (higher: better attacks)
      t.integer :critical_mod, null: false, default: 0 # added to critical rolls (higher: greater criticals)
      t.integer :base, null: false
    end

    add_foreign_key :weapon_stat_templates, :item_templates, on_delete: :cascade
  end

end
