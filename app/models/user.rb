require 'bcrypt'

class User < ActiveRecord::Base

	validates_presence_of :name, :on => :create
	validates :name, presence: true, :on => :create
	validates :email, presence: true, :on => :create
	validates :password, presence: true, :on => :create
	
	has_many :donuts, dependent: :destroy
	# dependent: :destroy used for when users are deleted, all the related data is 
	# deleted with it (donuts associated to users)
	
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

end
