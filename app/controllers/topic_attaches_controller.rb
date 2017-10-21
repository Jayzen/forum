class TopicAttachesController < ApplicationController
  before_action :logged_in_user

  def upload
    @attach = TopicAttach.new
    @attach.image = params[:upload_file]
    @attach.user_id = current_user.id
    success = true
    msg = '上传成功'
    file_path = ''
    if @attach.save
      success=true
      render json: { :success=> success, :msg=>msg, :file_path=> @attach.image.url }
    else
      success=false
      render json: { :success=> false }
    end
  end
  
  private
    def logged_in_user
      unless logged_in?
        store_location
        flash[:notice] = "please login in"
        redirect_to login_url
      end
    end
end
