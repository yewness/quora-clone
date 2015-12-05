require 'byebug'
#User login

post '/users/login' do
  user = User.find_by(email: params[:email])
	if user && user.authenticate(params['password'])
		session[:user_id] = user.id
		redirect "/users/#{user.id}"
	else
		@error = "Invalid email/password combination"
		erb :"user/index"
	end
end

# User logout

get '/users/logout' do
	session[:user_id] = nil
	redirect '/'
end

# Display new user form

get '/users/new' do
	erb :"user/new"
end

# Create new user

post '/users' do
	user = User.create(name: params[:name], email: params[:email], password: params[:password])
		if user.valid?
			redirect "/users/#{user.id}"
		else
			if user.email == User.find_by_email(params[:email]).email
		  	@error = "The email is not available."
				erb :"user/new"
			elsif user.password.length <= 6
				@error = "Your password must be at least 6 characters."
				erb :"user/new"
			end
		end
end

# Display user edit form

get '/users/:id/edit' do
	@user = User.find(params[:id])
	erb :'user/edit'
end 

# Update user

patch '/users/:id' do
	user = User.find(params[:id])
		if params[:password].nil?
			user.password = params[:password]
		end
	user.update(name: params[:name], email: params[:email], description: params[:description])
	redirect "/users/#{user.id}"
end

# Delete user

delete '/users/:id' do
	user = User.find(params[:id])
	user.destroy
	erb :'static/index'
end

# View user profile

get '/users/:id' do
	@user = User.find(params[:id])
	erb :'user/show'
end

# View login page

get '/users' do
	@user = current_user
		if logged_in?
			session[:user_id] = @user.id
			redirect "/users/#{@user.id}"
			erb :'user/show'
		else
			erb :'user/index'
		end
end