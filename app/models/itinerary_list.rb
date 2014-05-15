class ItineraryList
  include Mongoid::Document
  field :name, type: String
  has_many :itineraries, :dependent => :destroy
  accepts_nested_attributes_for :itineraries
  
  belongs_to :user
end
