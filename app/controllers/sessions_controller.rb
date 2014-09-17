class SessionsController < ApplicationController
  before_filter :set_user
  before_filter :logged_in?, only: [:new]

  def new
    logged_in?
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password].pop)
      session[:user_id] = user.id
      redirect_to users_path
    else
      @user = User.new
      @user.errors.add(:email, "or password is invalid.")
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
