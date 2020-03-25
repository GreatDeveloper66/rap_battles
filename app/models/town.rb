class Town < ApplicationRecord
  has_many :venues
  
  def addVenue(name,points)
    town_id = self.id
    Venue.create(name: name,points:points,town_id: town_id)
  end
end
