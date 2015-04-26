require 'net/http'

class TripController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :json

  def show
    @trip = Trip.find(params[:id])
    respond_with @trip
  end

  def index
    @trips = Trip.all
    respond_with @trips
  end

  def create
    @trip = Trip.new(trip_parameters)
    @trip.start_date = Date.parse(trip_parameters[:start_date])
    @trip.max_cost = trip_parameters[:max_cost].to_i
    @trip.save
    locations_data = HTTParty.get(get_locations_url, {apikey: 'QW3ItzI2KsWJQ8YHg2ysbapNVMc2bteI'})
    all_locations = JSON.parse(locations_data.to_json)["results"]
    20.times do ||
      location = all_locations.sample
      @trip.locations.create(name: location["destination"], cost: location["price"].to_i)
    end
    respond_with @trip
  end

  def get_locations_url
    departure_airport = trip_parameters[:departure_airport]
    duration = ( Date.parse(trip_parameters[:end_date]) - Date.parse(trip_parameters[:start_date]) ).to_i
    max_cost = trip_parameters[:max_cost].to_i
    start_date = trip_parameters[:start_date]
    "https://api.sandbox.amadeus.com/v1.2/flights/inspiration-search?apikey=QW3ItzI2KsWJQ8YHg2ysbapNVMc2bteI&origin=#{departure_airport}&departure_date=#{start_date}&duration=#{duration}&max_price=#{max_cost}"
  end

  private
    def trip_parameters
      params.require(:trip).permit(:start_date, :end_date, :max_cost, :voting_active?, :departure_airport)
    end
end
