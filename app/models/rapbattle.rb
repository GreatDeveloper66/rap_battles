class Rapbattle < ApplicationRecord
  belongs_to :challenger, class_name: 'User'
  belongs_to :challengee, class_name: 'User'
  has_many :trashbattles
  has_many :trashtalks, through: :trashbattles
  def winner
    
  end
end
