class ChatroomsController < ApplicationController
  before_action :require_user_redirect
  def index
    @message = Message.new
    @messages = Message.all
  end
  private
  def require_user_redirect
    if !logged_in?
      flash[:warning] = "You have to log in to do this action"
      redirect_to login_path
    end
  end
end
