class AddUserIdToTopicAttach < ActiveRecord::Migration[5.1]
  def change
    add_column :topic_attaches, :user_id, :integer
    remove_column :topic_attaches, :topic_id, :integer
  end
end
