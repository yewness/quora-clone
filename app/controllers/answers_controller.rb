# Display new answer
# Create new answer

get '/posts/:id/answers/new' do
	@post = Post.find(params[:id])
	erb :'answer/new'
end

post '/posts/:id/answers' do
	answer = Answer.create(body: params[:body], user_id: session[:user_id], post_id: params[:id])
	redirect "/posts/#{answer.post_id}"
end

# Display answer edit form

get '/posts/:post_id/answers/:id/edit' do
	@post = Post.find(params[:post_id])
	@answer = Answer.find(params[:id])
	erb :"answer/edit"
end 

# Update post

patch '/posts/:post_id/answers/:id' do
	answer = Answer.find(params[:id])
	answer.update(body: params[:body])
	redirect "/posts/#{answer.post.id}"
end

# # Delete answer

delete '/posts/:post_id/answers/:id' do
	answer = Answer.find(params[:id])
	answer.destroy
	redirect to "/posts/#{answer.post.id}"
end