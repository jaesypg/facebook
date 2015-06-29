
#1 display a list of all statuses
get '/comments' do
end

#2 return an HTML form for creating a new status
get '/comments/new' do
end

#3 create a new status
post '/comments' do
  @comment = Comment.new(params[:comment])
  @comment.save
  redirect to '/statuses'
end

#4 display a specific status
get '/comments/:id' do
end

#5 return an HTML form for editing a status
get '/comments/:id/edit' do
  @comment = Comment.find(params[:id])
  erb :"comment/edit_comment"
end

#6 update a specific status
put '/comments/:id' do
  Comment.find(params[:id]).update_attributes(params[:comment])
  redirect to '/statuses'
end

#5 return an HTML form for deleting a status
get '/comments/:id/delete' do
  @comment = Comment.find(params[:id])
  erb :"comment/delete_comment"
end

#7 delete a specific status
delete '/comments/:id' do
  Comment.find(params[:id]).destroy
  redirect to '/statuses'
end

