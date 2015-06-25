enable :sessions

get '/users' do
  # Look in app/views/index.erb
  erb :index
end

post '/users/new' do
  @user = User.new(params)

  User.new(params[:a])
  params[:b]
  @user.save
  redirect to '/'
end

post '/users/login' do

  # User.authenticate(params)
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:name] = @user[:name] #create session hash
    redirect to '/secret'
  else
    erb :invalid
  end
end

#pre-route logic (before filter)
before '/secret' do
  if session[:name] == nil
    redirect to '/'
  end
end

get '/secret' do
    erb :secret
end

post '/users/logout' do
  session[:name] =  nil
  # session.clear
  redirect to '/'
end

