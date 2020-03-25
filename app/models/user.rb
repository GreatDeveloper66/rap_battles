class User < ApplicationRecord
  has_many :challenged_users, foreign_key: 'challenger_id', class_name: 'Rapbattle'
  has_many :challengees, through: :challenged_users
  has_many :challenging_users, foreign_key: 'challengee_id', class_name: 'Rapbattle'
  has_many :challengers, through: :challenging_users

  def challenge(another_user)
    
  end
end
