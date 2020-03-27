class Trashtalk < ApplicationRecord
  has_many :trashbattles
  has_many :rapbattles, through: :trashbattles

  def self.sample_trashtalk
    [self.snippet,self.snippet,self.snippet,self.snippet,self.snippet]
  end
  def self.snippet
    Trashtalk.all.to_a.sample
  end
end
