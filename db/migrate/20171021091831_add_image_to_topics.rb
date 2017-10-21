class AddImageToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :image, :string
  end
end
