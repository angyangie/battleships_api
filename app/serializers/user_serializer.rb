class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :email, :player_rank

  has_many :user_games
  has_many :games, through: :user_games
  has_many :ships, through: :user_games

end
