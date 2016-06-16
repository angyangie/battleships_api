class GameSerializer < ActiveModel::Serializer
  attributes :id, :completed, :game_type

  has_many :scores 
  has_many :users, through: :scores
  has_many :ships
  belongs_to :winner

end
