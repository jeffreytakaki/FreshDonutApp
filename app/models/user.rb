require 'bcrypt'

class User < ActiveRecord::Base

	validates_presence_of :name
	validates :name, presence: true
	validates :email, presence: true
	validates :password, presence: true
	
	has_many :donuts
	
	geocoded_by :address   # can also be an IP address
	after_validation :geocode

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

  def show
  	@user = User.find(params[:id])
  end
end
