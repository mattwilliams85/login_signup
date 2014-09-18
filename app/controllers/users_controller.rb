class UsersController < ApplicationController
  before_filter :set_user
  before_filter :logged_in?, only: [:new]

  def index
  end

  def new
    logged_in?
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.name = @user.email.slice(0..(@user.email.index('@') - 1))
      @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      render "new"
    end
  end

  def show
  end

  def edit
    @user = current_user
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render "edit"
    end
  end

private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
