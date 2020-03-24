class Venue < ActiveRecord
  belongs_to :town
  has_many :rapbattles
end
