#Create new user

get '/users/new' do
	erb :"/user/new"
end

post '/users' do
	user = User.create(name: params[:name], email: params[:email], password: params[:password])
	redirect "/users/#{user.id}" #Not users/:id, it won't work
end

#Delete user

delete '/users/:id' do

end

#Display user edit form
#Update user

get '/users/:id/edit' do
	@user = User.find(params[:id])
	erb :'user/edit'
end

patch '/users/:id' do

end

#View user profile

get '/users/:id' do #':id will take whatever in'
	@user = User.find(params[:id])
	erb :'user/show'
end