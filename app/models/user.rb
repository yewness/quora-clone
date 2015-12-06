class User < ActiveRecord::Base
	has_many :posts
	has_many :answers

	validates :email, uniqueness: true, format: {with: /\w{1,}\@\w{1,}\.\w{2,}/}
	has_secure_password
	validates :password, length: { minimum: 6 }, allow_nil: true
	
	
end 
