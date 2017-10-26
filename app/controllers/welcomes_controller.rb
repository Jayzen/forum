class WelcomesController < ApplicationController
  before_action :find_categories

  def index
    search = params[:search].present? ? params[:search] : nil
    @topics = if search
      Topic.where("title LIKE ?", "%#{search}%").order("created_at desc").page(params[:page])
    else
      Topic.all.order("created_at desc").page(params[:page])
    end
  end

  def hot
    @topics = Topic.all.order("created_at desc").page(params[:page])
  end

  def cold
    @topics = Topic.all.order("created_at desc").page(params[:page])
  end

  private
    def find_categories
      @categories = Category.grouped_data
    end
end
