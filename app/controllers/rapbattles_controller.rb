class RapbattlesController < ApplicationController
  def home
  end
  def show
    @newrapbattle = Rapbattle.find_by(id: params[:id])
    @challenger = User.find_by(id: @newrapbattle[:challenger_id])
    @challengee = User.find_by(id: @newrapbattle[:challengee_id])
    @challengee_points = @newrapbattle[:challengee_points]
    @challenger_points = @newrapbattle[:challenger_points]
  end

  def new
    @rapbattle = Rapbattle.new
    @venues = Venue.all.to_a
    @rappers = User.all.to_a.select do |u|
      u.id != session[:user_id]
    end
  end
  
  def create
    @current_user = User.find_by(id: session[:user_id])
    venue_id = params[:rapbattle][:venue_id]
    other_rapper_id = params[:rapbattle][:id]
    venueat = Venue.find_by(id: venue_id)
    other_rapper = User.find_by(id: other_rapper_id)
    newrapbattleid = @current_user.challenge(other_rapper, venueat)
    @newrapbattle = Rapbattle.find_by(id: newrapbattleid)
    redirect_to rapbattle_path(@newrapbattle)
  end
  def index
  end
  private
  def rapbattle_params
    params.require(:rapbattle).permit()
  end
end
