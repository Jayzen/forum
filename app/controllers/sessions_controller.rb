class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      login_in user
      redirect_to user
    else
      flash.new[:notice] = "email or password wrong"
      render 'new'
    end
    
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
