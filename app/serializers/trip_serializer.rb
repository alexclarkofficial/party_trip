class TripSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :departure_airport, :locations, :max_cost
end
