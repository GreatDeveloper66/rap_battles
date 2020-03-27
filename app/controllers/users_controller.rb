class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only:[:new,:create]
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
  def edit
    @user = User.find_by(id: params[:id])
  end
  def update
    @user = User.find_by(id: params[:id])
    if User.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end
  def index
  end

  private

  def user_params
    params.require(:user).permit(:name,:username,:email,:password)
  end
  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
