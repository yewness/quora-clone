class User < ActiveRecord::Base
	attr_accessor :password

	has_many :posts
	validates :email, uniqueness: true, format: {with: /\w{1,}\@\w{1,}\.\w{2,}/}
	validates :password, length: {minimum: 6}, confirmation: true

end 
