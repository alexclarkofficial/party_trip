class LocationSerializer < ActiveModel::Serializer
  attributes :id, :cost, :name, :ratings, :votes_count, :total, :average
end
