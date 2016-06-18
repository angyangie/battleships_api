class Ship < ApplicationRecord
  belongs_to :user_game
  belongs_to :user
  delegate :hits, to: :user_game
  delegate :game, to: :user_game

  after_create :associate_user

  private

  def associate_user
    self.user = self.user_game.user
    save
  end

end
