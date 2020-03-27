class VenuesController < ApplicationController
  before_action :require_login
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
  def update
    @venue = Venue.find_by(params[:id])
    if @venue.update(venue_params)
      redirect_to venues_path
    else
      render :edit
    end
  end
  def create
  end
  private
    def venue_params
      params.require(:venue).permit(:name,:points)
    end
    def require_login
      return head(:forbidden) unless session.include? :user_id
    end
end
