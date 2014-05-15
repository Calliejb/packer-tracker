class Profile
  include Mongoid::Document
  include Mongoid::Paperclip

  has_mongoid_attached_file :picture
  validates_attachment_content_type :picture , :content_type => /\Aimage\/.*\Z/

  field :name, type: String
  field :hometown, type: String
  field :about, type: String

  belongs_to :user
end
