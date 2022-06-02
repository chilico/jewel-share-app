require_relative 'seeds_areas'

puts "Creating Chris, Maryam and Estef user ..."
chris = User.create(
  first_name: 'Chris',
  last_name: 'Owen',
  address: 'Crouch End, London, UK',
  email: 'chris@email.org',
  password: '123456',
  password_confirmation: '123456'
)
puts "Created user: #{chris.first_name} #{chris.last_name}"

maryam = User.create(
  first_name: 'Maryam',
  last_name: 'Fazlali',
  address: 'Wembley Park, London, UK',
  email: 'maryam@email.org',
  password: '123456',
  password_confirmation: '123456'
)
puts "Created user: #{maryam.first_name} #{maryam.last_name}"

estef = User.create(
  first_name: 'Estef',
  last_name: 'Perez',
  address: 'Clapham North, London, UK',
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
  user.address = "#{@areas.sample}, London, UK"
  user.email = Faker::Internet.email
  user.password = '123456'
  user.password_confirmation = '123456'
  user.save!
  puts "Created user: #{user.first_name} #{user.last_name}"
end

image_urls = {
  bracelet: [
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654162154/jewelry/bracelet/joel-ambass-8TWpDTEY5Vg-unsplash_oy2qfv.jpg',
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654162154/jewelry/bracelet/carlos-esteves-1MWbwTaeJIA-unsplash_jtwjca.jpg',
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654162154/jewelry/bracelet/stephanie-harvey-_Bh3FpwBIIQ-unsplash_nhzcza.jpg',
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654161938/jewelry/bracelet/sama-hosseini-h_ssRPj8UZo-unsplash_xwdkfn.jpg',
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654161937/jewelry/bracelet/sabrianna-2z7MxnXQs3k-unsplash_invf7v.jpg',
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654161937/jewelry/bracelet/philippe-van-doninck-hoC_u_9yJ_Y-unsplash_vsgpgd.jpg'
  ],
  earring: [
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654162002/jewelry/earring/miao-xiang-leFR7Fj3J6I-unsplash_lqwddc.jpg',
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654162002/jewelry/earring/daihana-monares-oWFPDjxuyUM-unsplash_vzmssh.jpg',
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654162002/jewelry/earring/cat-han-BJ3grTerqY4-unsplash_hkhnmu.jpg',
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654162001/jewelry/earring/lena-sifoo-GO_w0GYGxU0-unsplash_kdxcwk.jpg',
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654161858/jewelry/earring/arteum-ro-VJZdxfvFGuo-unsplash_wvkna6.jpg',
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654161853/jewelry/earring/mayank-gehlot-lsxBmX8Hmwc-unsplash_j7qliy.jpg',
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654161844/jewelry/earring/sabrianna-x_iL7y7VV4M-unsplash_piqaxv.jpg',
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654163177/jewelry/earring/jasmin-chew-UBeNYvk6ED0-unsplash_lrl5ow.jpg'
  ],
  necklace: [
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654162107/jewelry/necklace/andres-vera-CmmYT6Mm948-unsplash_dnpmsi.jpg',
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654162107/jewelry/necklace/sabrianna-u1Hv_erOQH0-unsplash_lv7ikf.jpg',
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654162106/jewelry/necklace/bulbul-ahmed-QFWGnLHnBNQ-unsplash_tt5yun.jpg',
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654162105/jewelry/necklace/eve-maier-7uQQHORcTpc-unsplash_o9g6yy.jpg',
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654161832/jewelry/necklace/tara-yates-ZL7JpQ3d1Yk-unsplash_pvg2ki.jpg',
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654161824/jewelry/necklace/bulbul-ahmed-tJnMnFMHFm0-unsplash_cswxzg.jpg',
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654161820/jewelry/necklace/alireza-zarafshani-7CnWk58BsFk-unsplash_yalhfq.jpg'
  ],
  ring: [
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654162042/jewelry/ring/sabrianna-yEJwDxAoHc0-unsplash_vzad3n.jpg',
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654162042/jewelry/ring/mariano-rivas-ZYet8yoepik-unsplash_ezcxjh.jpg',
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654161801/jewelry/ring/sabrianna-Y_bxfTa_iUA-unsplash_quksnl.jpg',
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654161790/jewelry/ring/sabrianna-NhrcL_C0sFA-unsplash_jfq8fj.jpg',
    'https://res.cloudinary.com/dtcfiatru/image/upload/v1654161782/jewelry/ring/sabrianna-9poB8SBFveA-unsplash_l9n86h.jpg'
  ]
}

users = User.all

users.each do |user|
  3.times do
    type = %w[bracelet earring necklace ring].sample
    jewel = Jewel.new
    jewel.user = user
    jewel.title = "#{Faker::Hipster.word.capitalize} #{type}"
    jewel.price = rand(0.0..75.0).round(2)
    jewel.description = Faker::Restaurant.description
    image_urls[type.to_sym].sample(3).each do |url|
      photo = URI.open(url)
      filename = "#{jewel.title}.jpg"
      jewel.photos.attach(io: photo, filename: filename, content_type: "image/png")
    end
    jewel.save
  end
end

users.each do |user|
  ids = Jewel.where.not(user: user).sample(3).map(&:id)
  count = 0
  3.times do
    booking = Booking.new(
      start_date: (Date.today + (0..25).to_a.sample),
      end_date: (Date.today + (25..45).to_a.sample)
    )
    booking.user_id = user.id
    booking.jewel_id = ids[count]
    count += 1
    booking.save
  end
end
puts "Successfully seeded database!"
