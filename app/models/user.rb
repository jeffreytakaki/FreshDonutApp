require 'bcrypt'

class User < ActiveRecord::Base
	
	has_many :donuts

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
