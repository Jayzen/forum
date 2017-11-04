class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @categories = Category.grouped_data
    @topics = @category.topics.order("created_at desc").page(params[:page])
  end
end
