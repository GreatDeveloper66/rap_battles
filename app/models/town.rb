class Town < ApplicationRecord
  has_many :venues

  def addVenue(name,points,imgurl)
    town_id = self.id
    Venue.create(name: name,points:points,town_id: town_id,imgurl: imgurl )
  end
end
