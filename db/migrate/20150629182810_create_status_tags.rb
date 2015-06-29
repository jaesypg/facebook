class CreateStatusTags < ActiveRecord::Migration
  def change
    create_table :status_tags do |t|
      t.integer :status_id, unique: true
      t.integer :tag_id, unique: true
      t.timestamp null: false
    end

    create_table :tags do |t|
      t.string :name
      t.timestamp null: false
    end
  end
end
