class CreateAreas < ActiveRecord::Migration[6.1]

  def change
    create_table :areas do |t|
      t.string :name, null: false

      t.references :superarea, null: false, index: true
    end

    add_foreign_key :areas, :superareas, on_delete: :cascade
  end

end
