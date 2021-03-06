class CreateAasmTemplates < ActiveRecord::Migration[6.1]

  def change
    create_table :aasm_templates do |t|
      t.integer :code, null: false, default: 0

      t.references :character_template, null: false, index: true
    end

    add_foreign_key :aasm_templates, :character_templates, on_delete: :cascade
  end

end
