require "bcrypt"
class User
  include Mongoid::Document
  include Mongoid::Paperclip
  
  field :username, type: String
  field :email, type: String
  field :password_digest, type: String

  field :name, type: String
  field :hometown, type: String
  field :about, type: String

  has_many :itinerary_lists, :dependent => :destroy
  accepts_nested_attributes_for :itinerary_lists, :allow_destroy => true

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
