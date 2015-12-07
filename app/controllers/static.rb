get '/' do
	erb :"user/index"
	#if you're logged in, then go to index
end
