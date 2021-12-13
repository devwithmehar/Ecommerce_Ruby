# require "faker"

# Item.destroy_all

# Category.destroy_all

# Store.destroy_all

# 1.times do
#   store = Store.create(
#     name:    "Café Coffee Day",
#     address: "21 McPhillips",
#     email:   "meharsahil207@gmail.com"
#   )

#   4.times do
#     categories = Category.create(
#       name:     Faker::Coffee.variety,
#       store: store
#     )
#     10.times do
#       items = Item.create(
#           name: Faker::Coffee.blend_name,
#           description:Faker::Coffee.notes,
#           quantity: rand(1..100),
#           price: Faker::Commerce.price,
#           category: categories,
#           store: store
#       )

# query = URI.encode_www_form_component([items.name, categories.name].join(','))
# download_image = URI.open("https://source.unsplash.com/600x600/?#{query}")
# items.image.attach(io: download_image, filename: "m-#{[items.name, categories.name].join('-')}.jpg")
# sleep(1)
#     end

#   end
# end


Province.destroy_all
Province.create({ name: 'Manitoba', GST: '5', PST: '7', HST: '0' })

Province.create({ name: 'Alberta', GST: '5', PST: '0', HST: '0' })

Province.create({ name: 'British Columbia', GST: '5', PST: '7', HST: '0' })

Province.create({ name: 'New Brunswick', GST: '0', PST: '0', HST: '15' })

Province.create({ name: 'New Foundland and Labrador', GST: '0', PST: '0', HST: '15' })

Province.create({ name: 'NorthWest Territories', GST: '5', PST: '0', HST: '0' })

Province.create({ name: 'NovaScotia', GST: '0', PST: '0', HST: '15' })

Province.create({ name: 'Nunavut', GST: '5', PST: '0', HST: '0' })

Province.create({ name: 'Ontario', GST: '0', PST: '0', HST: '13' })

Province.create({ name: 'Prince Edward Island', GST: '0', PST: '0', HST: '15' })

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
 end
