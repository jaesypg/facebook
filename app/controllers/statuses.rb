
#1 display a list of all statuses
get '/statuses' do
  # @statuses = Status.where(user_id: session[:id])
  @statuses = Status.all
  erb :"status/show_status"
end

#2 return an HTML form for creating a new status
get '/statuses/new' do
end

#3 create a new status
post '/statuses' do

  #another method using active record relation (instead of using hidden field status[user_id])
  # @user = User.find(session[:id])
  # @status = @user.statuses.new(params[:status])
  # @status.save

  @tag = Tag.new(params[:tag])
  # byebug
  @status = Status.new(params[:status])
  if @tag.save
    if @status.save
      @status.tags << @tag
      redirect to "/statuses"
    else
      @error = "Invalid input"
    end
  else
    @error = "Invalid input"
  end
  # @status.save
  # redirect to '/statuses'
end

#4 display a specific status
get '/statuses/:id' do
end

#5 return an HTML form for editing a status
get '/statuses/:id/edit' do
  @status = Status.find(params[:id])
  erb :"status/edit_status"
end

#6 update a specific status
put '/statuses/:id' do
  Status.find(params[:id]).update_attributes(params[:status])
  redirect to '/statuses'
end

#5 return an HTML form for deleting a status
get '/statuses/:id/delete' do
  @status = Status.find(params[:id])
  erb :"status/delete_status"
end

#7 delete a specific status
delete '/statuses/:id' do
  Status.find(params[:id]).destroy
  redirect to '/statuses'
end

#show all the comments for a status
get '/statuses/:id/comments' do
  @status = Status.find(params[:id])
  @comments = @status.comments  #one=to-many relationship
  # @comments = Comment.where(status_id: params[:id])
  erb :"comment/show_comment"
end

#a like for the status
#.first will return nil Like object
# then only can use .nil? to check if true or false
get '/statuses/:id/likes' do
  @like =Like.where(status_id: params[:id], user_id: session[:id]).first
  if @like.nil?
    @like = Like.new
    @like.status_id = params[:id]
    @like.user_id = session[:id]
    @like.save
    redirect to '/statuses'
  else
    @cannot_like = "Error: Too bad, you can't like this again...so sad"
    redirect to "/statuses?msg=#{@cannot_like}"
  end
end
