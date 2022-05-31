puts "Creating users ..."
5.times do
  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.address = Faker::Address.street_address
  user.email = Faker::Internet.email
  password = Faker::Internet.password
  user.password = password
  user.password_confirmation = password
  user.save!
  puts "Created user: #{user.first_name} #{user.last_name}"
end
puts "Successfully seeded database!"
