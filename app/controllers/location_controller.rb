class LocationController < ApplicationController
  respond_to :json


  def index
    @locations = Location.all
    respond_with @locations
  end
end
