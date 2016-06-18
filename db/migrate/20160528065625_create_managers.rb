class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.integer :student_id
      t.boolean :presence, null: false, default: true

      t.timestamps null: false
    end
  end
end
