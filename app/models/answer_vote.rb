class AnswerVote < ActiveRecord::Base
	belongs_to :user
	belongs_to :answer
	# validates :user, uniqueness: { scope: :answer,
 #                                    message: "User can only vote on this answer one time" }
end
