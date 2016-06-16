class Game < ApplicationRecord
  has_many :scores 
  has_many :users, through: :scores
  has_many :ships
  belongs_to :winner, class_name: "User"

  # def winner
  #   if self.winner
  #     User.find_by(id: this.winner_id)
  #   end
  # end

end
