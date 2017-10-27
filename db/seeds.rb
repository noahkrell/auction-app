require 'faker'
100.times.map do
  User.create!( :username => Faker::Name.name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end

20.times do
  Item.create!(title: Faker::Name.title, condition: "Good", start_date: Faker::Date.between(2.days.ago, Date.today), end_date: Faker::Date.forward(5), description: Faker::Hipster.paragraph(4), price: rand(0..100), owner_id: rand(1..100))
end

# users.each do |user|
#   user_bids = channels.sample(rand(2..4))
#   user_channels.each do |channel|
#     Subscription.create!(user: user,
#                          channel: channel)
#   end
# end
