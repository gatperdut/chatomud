class CreateMissileStatTemplates < ActiveRecord::Migration[6.1]

  def change
    create_table :missile_stat_templates do |t|
      t.references :item_template, null: false, index: true
      t.integer :missile_type, null: false, default: 0
    end

    add_foreign_key :missile_stat_templates, :item_templates, on_delete: :cascade
  end

end
