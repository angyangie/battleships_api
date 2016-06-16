class GameSerializer < ActiveModel::Serializer
  attributes :id, :completed, :winner, :type
end
