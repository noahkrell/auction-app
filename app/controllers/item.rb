get '/items/new' do
  @user = User.find(session[:user_id])
  erb :"items/new"
end

post '/items' do
  params[:owner_id] = session[:user_id]
  Item.create(params)
  redirect "/users/#{session[:user_id]}"
end

get '/items/:id' do
  if session[:user_id]
    @bid = Bid.find_by(item_id: params[:id], bidder_id: session[:user_id])
    @user = User.find(session[:user_id])
  end
  @item = Item.find(params[:id])
  erb :"items/item"
end

get '/items/:id/edit' do
  @user = User.find(session[:user_id])
  @item = Item.find(params[:id])
  erb :"items/edit"
end

delete '/items/:id' do
  item = Item.find(params[:id])
  item.destroy
  redirect "users/#{session[:user_id]}"
end

put '/items/:id' do 
  item = Item.find(params[:id])
  params.delete("_method")
  params.delete("splat")
  params.delete("captures")
  item.update(params)
  redirect "users/#{session[:user_id]}"
end
