class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to users_path
  end

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to rapbattles_home_path
    else
      flash[:error] = "Invalid credentials"
      redirect_to login_path
    end
  end
  def home
  end
end
