class AddWeightToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :weight, :integer, default: 0
  end
end
