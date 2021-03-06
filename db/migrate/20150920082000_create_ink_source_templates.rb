class CreateInkSourceTemplates < ActiveRecord::Migration[6.1]

  def change
    create_table :ink_source_templates do |t|
      t.references :item_template, null: false, index: true

      t.references :spawned_item_template, null: true, index: true

      t.integer :ink_type, null: false, default: 0

      t.integer :charges, null: false, default: 0
    end

    add_foreign_key :ink_source_templates,        :item_templates,                                    on_delete: :cascade
    add_foreign_key :ink_source_templates,        :item_templates, column: :spawned_item_template_id, on_delete: :restrict
  end

end
