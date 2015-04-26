class TripSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :duration, :max_cost, :min_cost, :voting_active?, :departure_airport
end
