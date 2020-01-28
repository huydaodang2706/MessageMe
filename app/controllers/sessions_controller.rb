class SessionsController < ApplicationController
  before_action :require_user_redirect, only: [:new,:create]

  def new

  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to root_path
    else
      flash.now[:warning] = "There was something wrong with your login information"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to login_path
  end

  private
  def require_user_redirect
    if logged_in?
      flash[:warning] = "You have already logged in"
      redirect_to root_path
    end
  end
end
