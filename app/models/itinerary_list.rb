class ItineraryList
  include Mongoid::Document
  field :name, type: String
  has_many :itineraries, :dependent => :destroy
  accepts_nested_attributes_for :itineraries, :allow_destroy => true
  
  belongs_to :user
end
