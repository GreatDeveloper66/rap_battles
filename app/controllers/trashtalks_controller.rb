class TrashtalksController < ApplicationController
  before_action :require_login
  def new
    @trashtalk = Trashtalk.new
  end
  def create
    Trashtalk.create(trashtalk_params)
    redirect_to trashtalks_path
  end
  def show
    @trashtalk = Trashtalk.find_by(params[:id])
  end
  def index
    @trashtalks = Trashtalk.all
  end
  def edit
    @trashtalk = Trashtalk.find_by(id: params[:id])
  end
  def update
    @trashtalk = Trashtalk.find_by(id: params[:id])
    if @trashtalk.update(trashtalk_params)
      redirect_to trashtalks_path
    else
      @trashtalk = Trashtalk.find_by(id: params[:id])
      render :edit
    end
  end
  def destroy
    Trashtalk.destroy(params[:id])
    redirect_to trashtalks_path
  end
  private
  def trashtalk_params
    params.require(:trashtalk).permit(:snippet,:points)
  end
  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
