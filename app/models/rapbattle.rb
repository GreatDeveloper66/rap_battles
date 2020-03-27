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

  def find_insults
    trasharray = Trashbattle.find_for_battle(self)
    insults = trasharray.map{ |t| t.snippet }

    {
      challenger_insults: [insults[0],insults[2],insults[4],insults[6],insults[8]],
      challengee_insults: [insults[1],insults[3],insults[5],insults[7],insults[9]]
    }
  end

  def self.most_popular_trash
    trashes = self.all.map{ |s| s.trashtalks.to_a }
    trashes = trashes.flatten
    trashes = trashes.map{ |t| t.snippet}
    freq = trashes.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    trashes.max_by { |v| freq[v] }
  end

  def self.find_leader
    pointshash = {}
    self.all.to_a.each do |battle|
      if pointshash[battle.challenger.name]
        pointshash[battle.challenger.name] += battle.challenger_points
      else
        pointshash[battle.challenger.name] = battle.challenger_points
      end
      if pointshash[battle.challengee.name]
        pointshash[battle.challengee.name] += battle.challengee_points
      else
        pointshash[battle.challengee.name] = battle.challengee_points
      end
    end
    sorted = pointshash.sort_by{ |person, points| points }
    sorted.last[0]
  end
end
