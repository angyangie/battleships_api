class ShipSerializer < ActiveModel::Serializer
  attributes :id, :coordinates, :ship_type

  belongs_to :user_game
end
