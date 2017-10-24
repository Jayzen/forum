class ChangeColumnToComments < ActiveRecord::Migration[5.1]
  def change
    change_column :comments, :content, :text
  end
end
