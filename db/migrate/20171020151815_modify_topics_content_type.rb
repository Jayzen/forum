class ModifyTopicsContentType < ActiveRecord::Migration[5.1]
  def change
    change_column :topics, :content, :text
  end
end
