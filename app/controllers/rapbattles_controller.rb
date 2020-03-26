class RapbattlesController < ApplicationController
  def home
  end
  def show
    @newrapbattle = Rapbattle.find_by(id: params[:id])
    @challenger = User.find_by(id: @newrapbattle[:challenger_id])
    @challengee = User.find_by(id: @newrapbattle[:challengee_id])
    @challengee_points = @newrapbattle[:challengee_points]
    @challenger_points = @newrapbattle[:challenger_points]
    trasharray = Trashbattle.all.to_a.select do |t|
      t.rapbattle_id == params[:id].to_i
    end
    insults = trasharray.map { |t| Trashtalk.find_by(id: t.trashtalk_id).snippet}
    @challenger_insults = [insults[0],insults[2],insults[4],insults[6],insults[8]]
    @challengee_insults = [insults[1],insults[3],insults[5],insults[7],insults[9]]
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
    @users = User.all.to_a
  end
  private
  def rapbattle_params
    params.require(:rapbattle).permit()
  end
end
