class Admin::TopicAttachesController < Admin::BaseController
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
end
