class Rapbattle < ApplicationRecord
  belongs_to :challenger, class_name: 'User'
  belongs_to :challengee, class_name: 'User'
  has_many :trashbattles
  has_many :trashtalks, through: :trashbattles
  def winner
    if self.challenger_points > self.challengee_points
      self.challenger
    else
      self.challengee
    end
  end
  def self.total_trashtalks
    self.all.reduce(0) { |sum,r| sum + r.trashtalks.to_a.count }
  end
end
