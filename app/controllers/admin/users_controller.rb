class Admin::UsersController < Admin::BaseController
  before_action :find_admin_user, only: [:show, :destroy, :edit, :update]

  def index
    @users = User.all.page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
    if @user.authenticate(params[:user][:old_password]) 
      @user.attributes = params.require(:user).permit!
      if @user.save
        flash[:notice] = "更新成功"
        redirect_to admin_users_path
      else
        render :edit
      end
    else
      @user.errors.add(:old_password, "旧密码不正确!")
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
    flash[:notice] = "删除成功!"
  end

  private
    def find_admin_user
      @user = User.find(params[:id])
    end
end
