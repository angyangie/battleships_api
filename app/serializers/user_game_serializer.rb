class UserGameSerializer < ActiveModel::Serializer
  attributes :id, :user_game
  
  belongs_to :user
  belongs_to :game
end
