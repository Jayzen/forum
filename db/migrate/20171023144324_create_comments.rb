class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :topic_id

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :topic_id
  end
end
