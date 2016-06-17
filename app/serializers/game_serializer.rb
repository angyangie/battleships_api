class GameSerializer < ActiveModel::Serializer
  attributes :id, :completed, :game_type

  has_many :user_games 
  has_many :users, through: :user_games
  has_many :ships
  belongs_to :winner

end
