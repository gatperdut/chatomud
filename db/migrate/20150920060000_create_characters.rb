class CreateCharacters < ActiveRecord::Migration[6.1]

  def change
    create_table :characters do |t|
      t.string :name, null: false

      t.string :short_desc, null: false
      t.string :long_desc,  null: false
      t.text   :full_desc,  null: false

      t.string :image

      t.string :kwords, array: true

      t.boolean :npc, null: false, default: false
      t.boolean :gladiator, null: false, default: false

      t.string :gifts, null: false, array: true, default: [].to_yaml

      t.boolean :active, null: false, default: false

      t.references :player, index: true

      t.references :room, index: true, null: false

      t.timestamps
    end

    add_foreign_key :characters, :players, on_delete: :cascade
    add_foreign_key :characters, :rooms, on_delete: :restrict
  end

end
