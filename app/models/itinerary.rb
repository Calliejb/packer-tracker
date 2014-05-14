class Itinerary
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  field :country, type: String
  field :date_start, type: Date
  field :date_end, type: Date
  belongs_to :itinerary_list
end
