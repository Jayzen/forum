class RemoveImageFromTopics < ActiveRecord::Migration[5.1]
  def change
    remove_column :topics, :image, :string
  end
end
