get '/' do
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  @login_error = "Couldn't find an account associated with that username or password" if params['e']
  @register_error = "That email is already registered for an account!" if params['x']
  @items = Item.all
  erb :index
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect '/?e=1'
  end
end

post '/register' do
  user = User.find_by(email: params[:email])
  if !user
    user = User.create(params)
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect "/?x=1"
  end
end

get '/users/:id' do
  if !session[:user_id]
    redirect back
  elsif session[:user_id] == params[:id]
    @you = User.find(session[:user_id])
    @user = User.find(session[:user_id])
    erb :"users/profile"
  elsif session[:user_id] != params[:id]
    @you = User.find(session[:user_id])
    @user = User.find(params[:id])
    erb :"users/profile"
  end
end

post '/users/:bidder_id/items/:item_id/bid' do
  bid = Bid.find_by(item_id: params[:item_id], bidder_id: params[:bidder_id])
  if !bid
    Bid.create(item_id: params[:item_id], bidder_id: params[:bidder_id], amount: params[:amount])
    redirect "items/#{params[:item_id]}"
  end

end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end

post '/charge' do 
  @amount = params[:price].to_i*100

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :amount      => @amount,
    :description => 'Sinatra Charge',
    :currency    => 'usd',
    :customer    => customer.id
  )
  redirect '/' 
end

