puts "Creating Chris, Maryam and Estef user ..."
chris = User.create(
  first_name: 'Chris',
  last_name: 'Owen',
  address: 'Somewhere, Somewhere St.',
  email: 'chris@email.org',
  password: '123456',
  password_confirmation: '123456'
)
puts "Created user: #{chris.first_name} #{chris.last_name}"

maryam = User.create(
  first_name: 'Maryam',
  last_name: 'Fazlali',
  address: 'Somewhere, Somewhere St.',
  email: 'maryam@email.org',
  password: '123456',
  password_confirmation: '123456'
)
puts "Created user: #{maryam.first_name} #{maryam.last_name}"

estef = User.create(
  first_name: 'Estef',
  last_name: 'Perez',
  address: 'Somewhere, Somewhere St.',
  email: 'estef@email.org',
  password: '123456',
  password_confirmation: '123456'
)
puts "Created user: #{estef.first_name} #{estef.last_name}"

puts "Creating 5 random users ..."
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
