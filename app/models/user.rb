require "bcrypt"
class User
  include Mongoid::Document
  include Mongoid::Paperclip

  has_mongoid_attached_file :picture

  validates_attachment_content_type :picture , :content_type => /\Aimage\/.*\Z/


  field :username, type: String
  field :email, type: String
  field :password_digest, type: String
  has_many :itinerary_lists

  def password
    @password
  end

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def authenticate(test_password)
    if BCrypt::Password.new(self.password_digest) == test_password
      self
    else
      false
    end
  end
end
