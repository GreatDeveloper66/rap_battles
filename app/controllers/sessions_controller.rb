class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to home_path
  end

  def new

  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path
    else
        redirect_to login_path, alert: user.returnerrors
    end
  end
  def home
  end
end
