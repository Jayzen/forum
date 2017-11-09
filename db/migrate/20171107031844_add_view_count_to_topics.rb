class AddViewCountToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :view_count, :integer, default: 0
  end
end
