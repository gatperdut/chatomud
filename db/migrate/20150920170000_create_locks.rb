class CreateLocks < ActiveRecord::Migration[6.1]

  def change
    create_table :locks do |t|
      t.boolean :locked, null: false, default: true

      t.references :parent, null: false, index: true, polymorphic: true
    end
  end

end
