class Ship < ApplicationRecord
  belongs_to :user_game
  delegate :hits, to: :user_game
  delegate :user, to: :user_game
  delegate :game, to: :user_game
end
