class WelcomesController < ApplicationController
  def index
    search = params[:search].present? ? params[:search] : nil
    @topics = if search
      Topic.where("title LIKE ?", "%#{search}%").order("created_at desc").page(params[:page])
    else
      Topic.all.order("created_at desc").page(params[:page])
    end
    @categories = Category.grouped_data
  end
end
