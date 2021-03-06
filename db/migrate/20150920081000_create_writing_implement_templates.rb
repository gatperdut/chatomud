class CreateWritingImplementTemplates < ActiveRecord::Migration[6.1]

  def change
    create_table :writing_implement_templates do |t|
      t.references :item_template, null: false, index: true

      t.boolean :single_use, null: false, default: false
    end

    add_foreign_key :writing_implement_templates, :item_templates, on_delete: :cascade
  end

end
