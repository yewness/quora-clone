#to vote for question
post '/posts/:id/qvote' do
		@post_vote = PostVote.create(params[:postvote])
		redirect to "/posts/#{@post_vote.post_id}"
end

#to vote for answer

post '/posts/:id/avote' do
	@answer_vote = AnswerVote.create(params[:answervote])
	redirect to "/posts/#{@answer_vote.answer.post.id}"
end