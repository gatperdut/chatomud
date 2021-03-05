class CreateSuperareas < ActiveRecord::Migration[6.1]
  def change
    create_table :superareas do |t|
      t.string :name, null: false
    end
  end
end
