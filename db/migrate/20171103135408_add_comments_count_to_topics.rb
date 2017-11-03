class AddCommentsCountToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :comments_count, :integer, default: 0
  end
end
