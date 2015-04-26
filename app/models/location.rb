class Location < ActiveRecord::Base
  belongs_to :trip

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
