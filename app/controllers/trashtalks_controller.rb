class TrashtalksController < ApplicationController
  def new
  end
  def create
  end
  def index
    @trashtalks = Trashtalk.all
  end
  def edit
  end
  def update
  end
end
