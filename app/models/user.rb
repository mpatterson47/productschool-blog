class User < ActiveRecord::Base
    	DRIVING_AGE_LIMIT = 16

    def full_name
		"#{first_name} #{last_name}"
	end

	def can_drive?
		age >= DRIVING_AGE_LIMIT
		
	has_many :posts
	has_many :comments
	end
end
