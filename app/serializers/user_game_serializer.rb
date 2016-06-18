class UserGameSerializer < ActiveModel::Serializer
  attributes :id, :hits
  
  belongs_to :user
  belongs_to :game
  has_many :ships
end
