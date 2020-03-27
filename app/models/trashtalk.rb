class Trashtalk < ApplicationRecord
  has_many :trashbattles
  has_many :rapbattles, through: :trashbattles

  def self.sample_trashtalk
    trashtalks = []
    while trashtalks.length < 5 do
      s = self.snippet
      if !trashtalks.include? s
        trashtalks << s
      end
    end
    trashtalks
  end
  def self.snippet
    Trashtalk.all.to_a.sample
  end
end
