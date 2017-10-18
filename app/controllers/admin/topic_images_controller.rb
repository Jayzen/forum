class Admin::TopicImagesController < Admin::BaseController
  before_action :find_topic

  def index
    @topic_images = @topic.topic_images
  end

  def create
    if params[:attach].nil?
      flash[:notice] = "不能上传空图片!"
      redirect_to admin_topic_topic_images_path(topic_id: @topic)
    else
      params[:attach].each do |image|
        @topic.topic_images << TopicImage.new(attach: image)
      end
      flash[:notice] = "图片创建成功!"
      redirect_to admin_topic_topic_images_path(topic_id: @topic)
    end
  end

  def destroy
    @topic_image = @topic.topic_images.find(params[:id])
    if @topic_image.destroy
      flash[:notice] = "删除成功"
    else
      flash[:notice] = "删除失败"
    end

    redirect_to admin_topic_topic_images_path(topic_id: @topic)
  end

  def update
    @topic_image = @topic.topic_images.find(params[:id])
    @topic_image.weight = params[:weight]
    if @topic_image.save
      flash[:notice] = "修改成功"
    else
      flash[:notice] = "修改失败"
    end

    redirect_to admin_topic_topic_images_path(topic_id: @topic)
  end

  private
  def find_topic
    @topic = Topic.find params[:topic_id]
  end

end
