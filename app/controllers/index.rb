get '/tweets' do
  @tweets = $client.home_timeline.map { |tweet| tweet.text }
  erb :tweets
end
