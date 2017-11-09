class TopicsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :find_topic, only: [:edit, :update, :destroy]
  before_action :find_root_categories, only: [:new, :create, :edit, :update]
  
  def search
    search = params[:search].present? ? params[:search] : nil
    @topics = if search
      Topic.where("title LIKE ?", "%#{search}%").order("created_at desc").page(params[:page])
    else
      Topic.all.order("created_at desc").page(params[:page])
    end
    render file: 'welcomes/index'
  end 
 
  def show
    @topic = Topic.includes([{ comments: :user }, :user]).find(params[:id])
    @categories = Category.grouped_data
    @comment = Comment.new
    @comments = @topic.comments.order("created_at desc")
    @topic.increment!(:view_count)
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      flash[:notice] = "话题创建成功"
      redirect_to topic_path(@topic)
    else
      render action: :new
    end
  end

  def edit
    render action: :new
  end

  def update
    @topic.attributes = topic_params
    @topic.user_id = current_user.id
    if @topic.save
      flash[:notice] = "话题修改成功"
      redirect_to topic_path(@topic)
    else
      render action: :new
    end
  end

  def destroy
    if @topic.destroy
      flash[:notice] = "删除成功"
      redirect_to root_path
    else
      flash[:notice] = "删除失败"
      redirect_to :back
    end
  end
  
  private
    def find_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title, :content, :status, :category_id)
    end

    def find_root_categories
      @root_categories = Category.roots
    end 
end
