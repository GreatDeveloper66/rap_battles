class Venue < ApplicationRecord
  belongs_to :town
  has_many :rapbattles
end
