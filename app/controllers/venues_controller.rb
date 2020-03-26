class VenuesController < ApplicationController
  def show
  end
  def index
    @venues = Venue.all
  end
  def new
  end
  def edit
    @venue = Venue.find_by(params[:id])
  end
  def create
  end
end
