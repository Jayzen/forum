class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :following, :followers]
  before_action :correct_user, only: [:edit, :update]
  before_action :find_user, except: [:new, :index, :create]

  def new
    @user = User.new
  end

  def show
  end

  def index
    @users = User.all.order('id asc').where(activated: true).page(params[:page])
  end

  def topics
    @topics = @user.topics
  end

  def details
  end

  def replies
    @replies = @user.comments
  end

  def collections
  end

  def following
    @following_users = @user.following
  end

  def followers
    @followers_users = @user.followers
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:notice] = "用户激活邮件已经发送，请查看邮箱！"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = "用户更新成功!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:notice] = "用户请登录!"
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
    def find_user
      @user = User.find(params[:id])
    end
end
