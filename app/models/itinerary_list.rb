class ItineraryList
  include Mongoid::Document
  has_many :itinerary
  belongs_to :user
end
