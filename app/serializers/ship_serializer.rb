class ShipSerializer < ActiveModel::Serializer
  attributes :id, :coordinates, :hits, :ship_type

  belongs_to :game
  belongs_to :user
end
