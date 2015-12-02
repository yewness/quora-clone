get '/' do
	erb :"static/index"
	#if you're logged in, then go to index
end
