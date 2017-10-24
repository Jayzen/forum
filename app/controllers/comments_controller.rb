class CommentsController < ApplicationController
  before_action :logged_in_user

  def create
    @topic = Topic.find(params[:id])
    @comment = @topic.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "评论成功"
      redirect_to topic_path(@topic)
    else
      redirect_to topic_path(@topic)
    end
  end

  def destroy
    
  end

  private
    def logged_in_user
      unless logged_in?
        store_location
        flash[:notice] = "用户请登录!"
        redirect_to login_url
      end
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
