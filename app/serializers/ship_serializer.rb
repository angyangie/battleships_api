class ShipSerializer < ActiveModel::Serializer
  attributes :id, :coordinates, :ship_type

  belongs_to :user_game
  belongs_to :user
end
