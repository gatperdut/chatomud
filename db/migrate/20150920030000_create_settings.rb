class CreateSettings < ActiveRecord::Migration[6.1]

  def change
    create_table :settings do |t|
      t.boolean :ansi_coloring, default: false, null: false

      t.references :player, null: false, index: true
    end

    add_foreign_key :settings, :players, on_delete: :cascade
  end

end
