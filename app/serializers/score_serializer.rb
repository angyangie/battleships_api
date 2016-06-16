class ScoreSerializer < ActiveModel::Serializer
  attributes :id, :score
  
  belongs_to :user
  belongs_to :game
end
