class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:notice] = "该用户已经激活"
      redirect_to user
    else
      flash[:notice] = "invalid activation link"
      redirect_to root_url
    end
  end
end
