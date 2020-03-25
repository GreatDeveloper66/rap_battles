class TownsController < ApplicationController
  def show
  end
  def index
    @towns = Town.all
  end
  def new
  end
  def edit
  end
  def create
  end
end
