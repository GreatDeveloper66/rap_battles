class Trashbattle < ApplicationRecord
  belongs_to :trashtalk
  belongs_to :rapbattle
  def self.find_for_battle(rapbattle)
    arr = self.all.to_a.find_all { |trashbattle| trashbattle.rapbattle == rapbattle }
    arr.map { |tb| tb.trashtalk }
  end
end
