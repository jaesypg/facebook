enable :sessions

#1 display the homepage
get '/users' do
  # Look in app/views/index.erb
  erb :index
end

#3 create new user
post '/users' do
  @user = User.new(params[:user])
  @user.save
  redirect to '/'
end

#authenticate user
post '/users/login' do
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user
    session[:name] = @user[:name] #create session hash
    session[:id] = @user[:id]
    redirect to '/'
    # redirect to "/users/#{@user.id}"
  else
    erb :invalid
  end
end

#logout/kill user session
# post or get here???
# this comes before '/users/:id'???
get '/users/logout' do
  session[:name] =  nil
  session[:id] = nil
  # session.clear
  redirect to '/'
end

#4 display a specific user
get '/users/:id' do
  @user = User.find(params[:id])
  erb :"/user/show_profile"
end

#5 return an HTML form for editing an user
get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :"/user/edit_profile"
end

#6 update a specific user
# why there is error when using .update instead of .update_attributes
put '/users/:id' do
  User.find(params[:id]).update_attributes(params[:user])
  redirect to '/'
end

#5 return an HTML form for deleting an user
get '/users/:id/delete' do
  @user = User.find(params[:id])
  erb :"/user/delete_profile"
end

#7 delete a specific user
# how to combine the form for edit and delete???
delete '/users/:id' do
  User.find(params[:id]).destroy
  session[:name] =  nil
  redirect to '/'
end



