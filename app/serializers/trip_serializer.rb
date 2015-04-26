class TripSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :departure_airport, :locations
end
