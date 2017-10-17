class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.integer :category_id
      t.string :status, default: "off"

      t.timestamps
    end

    add_index :topics, :title
    add_index :topics, :user_id
    add_index :topics, :category_id
  end
end
