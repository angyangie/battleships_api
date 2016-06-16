class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :email, :player_rank

  has_many :scores
  has_many :games, through: :scores
  has_many :ships

end
