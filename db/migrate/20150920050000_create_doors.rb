class CreateDoors < ActiveRecord::Migration[6.1]

  def change
    create_table :doors do |t|
      t.string :short_desc, null: false
      t.string :long_desc,  null: false
      t.text   :full_desc,  null: false
      t.boolean :open, null: false, default: false
      t.boolean :see_through, null: false, default: false

      t.references :nr,  null: true, index: true
      t.references :er,  null: true, index: true
      t.references :sr,  null: true, index: true
      t.references :wr,  null: true, index: true
      t.references :ur,  null: true, index: true
      t.references :dr,  null: true, index: true
    end

    add_foreign_key :doors, :rooms, column: :nr_id,  on_delete: :restrict
    add_foreign_key :doors, :rooms, column: :er_id,  on_delete: :restrict
    add_foreign_key :doors, :rooms, column: :sr_id,  on_delete: :restrict
    add_foreign_key :doors, :rooms, column: :wr_id,  on_delete: :restrict
    add_foreign_key :doors, :rooms, column: :ur_id,  on_delete: :restrict
    add_foreign_key :doors, :rooms, column: :dr_id,  on_delete: :restrict

    add_foreign_key :rooms, :doors, column: :nd_id,  on_delete: :restrict
    add_foreign_key :rooms, :doors, column: :ed_id,  on_delete: :restrict
    add_foreign_key :rooms, :doors, column: :sd_id,  on_delete: :restrict
    add_foreign_key :rooms, :doors, column: :wd_id,  on_delete: :restrict
    add_foreign_key :rooms, :doors, column: :ud_id,  on_delete: :restrict
    add_foreign_key :rooms, :doors, column: :dd_id,  on_delete: :restrict
  end

end
