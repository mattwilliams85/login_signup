class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :set_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    redirect_to users_path if current_user
  end

  def set_user
    if params[:id] && params[:id] != "current"
      @user = User.find(params[:id])
    end
    @user ||= User.new
  end

end
