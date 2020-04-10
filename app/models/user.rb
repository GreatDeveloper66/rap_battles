class User < ApplicationRecord
  has_many :challenged_users, foreign_key: 'challenger_id', class_name: 'Rapbattle'
  has_many :challengees, through: :challenged_users
  has_many :challenging_users, foreign_key: 'challengee_id', class_name: 'Rapbattle'
  has_many :challengers, through: :challenging_users
  has_secure_password

  # //validates :email, uniqueness: true
  # //validates :
  validates :name, :presence => true
  validates :username, :presence => true
  validates :email, :presence => true
  validates :name, :uniqueness => true
  validates :username, :uniqueness => true
  validates :email, :uniqueness => true

  def challenge(another_user, fight_at_venue)
    challenger_array = Trashtalk.sample_trashtalk
    challengee_array = Trashtalk.sample_trashtalk
    challenger_points = challenger_array.reduce(0) { |sum,c| sum + c.points }
                        + fight_at_venue.points
    challengee_points = challengee_array.reduce(0) { |sum,c| sum + c.points }
                        + fight_at_venue.town.points

    newrapbattle = Rapbattle.create(
      challenger_id: self.id,
      challengee_id: another_user.id,
      venue_id: fight_at_venue.id,
      challenger_points: challenger_points,
      challengee_points: challengee_points
    )

    (challenger_array + challengee_array).each do |c|
      Trashbattle.create(trashtalk_id: c.id, rapbattle_id: newrapbattle.id)
    end
    newrapbattle.id
  end

  def returnerrors
    errorObj = {
      name: "Name Errors: #{self.errors.messages[:name].join(' and ')}",
      username: "User Name Errors: #{self.errors.messages[:username].join(' and ')}",
      email: "Email Errors: #{self.errors.messages[:email].join(' and ')}"
    }

    "#{errorObj[:name]} #{errorObj[:username]} #{errorObj[:email]}"

  end
end
