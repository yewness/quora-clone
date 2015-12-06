class PostVote < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
	# validates :user, uniqueness: { scope: :post,
 #                                    message: "User can only vote on this post one time" }
end
