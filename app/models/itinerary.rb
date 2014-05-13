class Itinerary
  include Mongoid::Document
  field :country, type: String
  field :date, type: Date
  belongs_to :user
end
