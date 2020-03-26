class RapbattlesController < ApplicationController
  def home
  end
  def new
    @rapbattle = Rapbattle.new
    @venues = Venue.all.to_a
    @rappers = User.all.to_a.select do |u|
      u.id != session[:user_id]
    end
  end
  def index
  end
end
