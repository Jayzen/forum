class WelcomesController < ApplicationController
  before_action :set_topics
  
  def index
    @topics = @topics.order("created_at desc")
  end

  def hot
    @topics = @topics.order("comments_count desc")
  end

  def cold
    @topics = @topics.order("comments_count asc")
  end

  private
    def set_topics
      @topics = Topic.includes([{ comments: :user }, :category, :user]).all.page(params[:page])
    end
end
