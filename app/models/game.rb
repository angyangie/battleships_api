class Game < ApplicationRecord
  has_many :user_games
  has_many :users, through: :user_games
  has_many :ships, through: :user_games
  belongs_to :winner, class_name: "User"

end

