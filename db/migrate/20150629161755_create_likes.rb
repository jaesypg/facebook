class CreateLikes < ActiveRecord::Migration
  def change
      create_table :likes do |t|
      t.integer :status_id, unique: true
      t.integer :user_id, unique: true
      t.timestamps null: false
    end
  end
end
