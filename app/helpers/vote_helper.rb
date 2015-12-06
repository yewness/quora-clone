helpers do 
	def post_count
		PostVote.where(post_id: @post.id, vote: 1).count - PostVote.where(post_id: @post.id, vote: -1).count
	end
end