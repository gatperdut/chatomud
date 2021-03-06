class CreateBoardTemplates < ActiveRecord::Migration[6.1]

  def change
    create_table :board_templates do |t|
      t.references :item_template, null: false, index: true
    end

    add_foreign_key :board_templates, :item_templates, on_delete: :cascade
  end

end
