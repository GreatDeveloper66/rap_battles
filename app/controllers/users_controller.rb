class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      @user = User.new
      render :new
    end
  end
  def index
  end
  private
  def user_params
    params.require(:user).permit(:name,:username,:email,:password)
  end
end
