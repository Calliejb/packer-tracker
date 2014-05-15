require "bcrypt"
class User
  include Mongoid::Document
  field :username, type: String
  field :email, type: String
  field :password_digest, type: String
  has_one :profile
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
