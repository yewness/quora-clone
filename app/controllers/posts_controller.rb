require 'byebug'
# Display new post form

get '/posts/new' do
	erb :"post/new"
end

# Create new post

post '/posts' do
	post = Post.create(title: params[:title], user_id: session[:user_id], body: params[:body])
	redirect "/posts/#{post.id}"
end

# Display post edit form

get '/posts/:id/edit' do
	@post = Post.find(params[:id])
	erb :'post/edit'
end 

# Update post

patch '/posts/:id' do
	post = Post.find(params[:id])
	post.update(title: params[:title], body: params[:body])
	redirect "/posts/#{post.id}"
end

# Delete post

delete '/posts/:id' do
	post = Post.find(params[:id])
	post.destroy
	erb :'post/index'
end

# View all post by the id

get '/posts/:id' do
	@post = Post.find(params[:id])
	erb :'post/show'
end

#official index posts

get '/posts' do
	erb :'post/index'
end