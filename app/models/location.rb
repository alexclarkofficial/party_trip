class Location < ActiveRecord::Base
  belongs_to :trip
  has_many :ratings

  def votes_count
    votes.length
  end

  def total
    votes.reduce(:+)
  end

  def average
    total / votes_count
  end
end
