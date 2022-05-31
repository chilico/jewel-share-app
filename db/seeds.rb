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

image_urls = [
  'https://res.cloudinary.com/dtcfiatru/image/upload/v1654012138/development/mayank-gehlot-lsxBmX8Hmwc-unsplash_k0z8ci.jpg',
  'https://res.cloudinary.com/dtcfiatru/image/upload/v1654012139/development/sabrianna-Y_bxfTa_iUA-unsplash_hc8bre.jpg',
  'https://res.cloudinary.com/dtcfiatru/image/upload/v1654012138/development/arteum-ro-VJZdxfvFGuo-unsplash_r3bzkp.jpg',
  'https://res.cloudinary.com/dtcfiatru/image/upload/v1654012138/development/tara-yates-ZL7JpQ3d1Yk-unsplash_fmfedb.jpg',
  'https://res.cloudinary.com/dtcfiatru/image/upload/v1654012136/development/bulbul-ahmed-tJnMnFMHFm0-unsplash_oemjoy.jpg',
  'https://res.cloudinary.com/dtcfiatru/image/upload/v1654012136/development/sabrianna-NhrcL_C0sFA-unsplash_vjztuu.jpg',
  'https://res.cloudinary.com/dtcfiatru/image/upload/v1654012136/development/sabrianna-x_iL7y7VV4M-unsplash_d8j9za.jpg',
  'https://res.cloudinary.com/dtcfiatru/image/upload/v1654012135/development/jasmin-chew-UBeNYvk6ED0-unsplash_lldfph.jpg',
  'https://res.cloudinary.com/dtcfiatru/image/upload/v1654012135/development/sabrianna-9poB8SBFveA-unsplash_sxvouu.jpg',
  'https://res.cloudinary.com/dtcfiatru/image/upload/v1654012134/development/alireza-zarafshani-7CnWk58BsFk-unsplash_ujn07b.jpg'
]

users = User.all
users.each do |user|
  3.times do
    jewel = Jewel.new
    jewel.user = user
    jewel.title = Faker::Hipster.word.capitalize
    jewel.price = Faker::Number.decimal(l_digits: 3, r_digits: 2)
    jewel.description = Faker::Lorem.paragraph(sentence_count: 4)
    photo = URI.open(image_urls.sample)
    filename = "#{Faker::Hipster.word}.jpg"
    jewel.photos.attach(io: photo, filename: filename, content_type: "image/png")
    jewel.save
  end
end

puts "Successfully seeded database!"
