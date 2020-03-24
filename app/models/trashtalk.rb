class Trashtalk < ApplicationRecord
  has_many :trashbattles
  has_many :rapbattles, through: :trashbattles
end
