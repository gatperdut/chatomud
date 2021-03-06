class CreateMeleeStats < ActiveRecord::Migration[6.1]

  def change
    create_table :melee_stats do |t|
      t.references :weapon_stat, index: true
      t.string :sheathed_desc
    end

    add_foreign_key :melee_stats, :weapon_stats, on_delete: :cascade
  end

end
