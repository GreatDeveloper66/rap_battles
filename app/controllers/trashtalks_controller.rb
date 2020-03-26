class TrashtalksController < ApplicationController
  def new
    @trashtalk = Trashtalk.new
  end
  def create
    Trashtalk.create(trashtalk_params)
    redirect_to trashtalks_path
  end
  def index
    @trashtalks = Trashtalk.all
  end
  def edit
  end
  def update
  end
  private
  def trashtalk_params
    params.require(:trashtalk).permit(:snippet,:points)
  end
end
