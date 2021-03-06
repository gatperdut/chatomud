class CreateTextInfos < ActiveRecord::Migration[6.1]

  def change
    create_table :text_infos do |t|
      t.references :parent,     null: false, index: true, polymorphic: true

      t.references :character,  null: true,  index: true

      t.integer    :ink_type, null: false, default: 0

      t.integer    :language,           null: false, default: 0

      t.integer    :script,             null: false, default: 0

      t.integer    :language_skill_mod, null: true

      t.integer    :script_skill_mod,   null: true
    end

    add_foreign_key :text_infos, :characters, on_delete: :restrict
  end

end
