class Profile
  include Mongoid::Document
  field :name, type: String
  field :hometown, type: String
  field :about, type: String

  embedded_in :user
end
