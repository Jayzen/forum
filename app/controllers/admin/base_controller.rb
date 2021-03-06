class Admin::BaseController < ActionController::Base
  layout 'admin/layouts/admin'

  include SessionsHelper
  include UsersHelper

  before_action :auth_admin

  private
    def auth_admin
      unless logged_in? && current_user.admin?
        flash[:notice] = "请以管理员身份登录"
        redirect_to login_path
      end
    end
end
