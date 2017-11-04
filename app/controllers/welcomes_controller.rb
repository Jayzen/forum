class WelcomesController < ApplicationController
  def index
    @topics = Topic.all.order("created_at desc").page(params[:page])
  end

  def hot
    @topics = Topic.all.order("comments_count desc").page(params[:page])
  end

  def cold
    @topics = Topic.all.order("comments_count asc").page(params[:page])
  end
end
