class TopicsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :find_topic, only: [:edit, :update, :destroy, :show]
  before_action :find_root_categories, only: [:new, :create, :edit, :update]

  def index
    @topics = Topic.page(params[:page]).order("id desc")
  end

 
  def show
    @categories = Category.grouped_data
    @comment = Comment.new
    @comments = @topic.comments
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
      redirect_to admin_topics_path
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

    def logged_in_user
      unless logged_in?
        store_location
        flash[:notice] = "请先进行登录!"
        redirect_to login_url
      end
    end

    def correct_user
      @topic = Topic.find(params[:id])
      @user = @topic.user
      redirect_to(root_path) unless current_user?(@user)
    end
end
