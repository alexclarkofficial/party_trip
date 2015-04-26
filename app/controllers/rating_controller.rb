class RatingController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :json

  def create
    @location = Location.find(rating_parameters[:location_id])
    @location.ratings.create(vote: rating_parameters[:vote])
    respond_with @location
  end

  private
  def rating_parameters
    params.require(:rating).permit(:location_id, :vote)
  end
end
