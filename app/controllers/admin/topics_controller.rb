class Admin::TopicsController < Admin::BaseController
  before_action :find_topic, only: [:edit, :update, :destroy]
  before_action :find_root_categories, only: [:new, :create, :edit, :update]

  def index
    @topics = Topic.page(params[:page]).order("id desc")
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      flash[:notice] = "话题创建成功"
      redirect_to admin_topics_path
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
      redirect_to admin_topics_path
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
end
