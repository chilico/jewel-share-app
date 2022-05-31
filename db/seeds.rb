5.times do
  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.address = Faker::Address.street_address
  user.email = Faker::Internet.email
  user.encrypted_password = Faker::Internet.password
  user.save!
end
