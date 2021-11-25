require "faker"

Item.destroy_all

Category.destroy_all

Store.destroy_all

1.times do
  store = Store.create(
    name:    "Café Coffee Day",
    address: "21 McPhillips",
    email:   "meharsahil207@gmail.com"
  )

  10.times do
    categories = Category.create(
      name:     Faker::Coffee.variety,
      store: store
    )
    5.times do
      items = Item.create(
          name: Faker::Coffee.blend_name,
          price: Faker::Commerce.price,
          category: categories,
          store: store
      )
      query = URI.encode_www_form_component([items.name, categories.name].join(','))
      download_image = URI.open("https://source.unsplash.com/600x600/?#{query}")
      items.image.attach(io: download_image, filename: "m-#{[items.name, categories.name].join('-')}.jpg")
      sleep(1)
    end

  end
end

# if Rails.env.development?
#   AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
#  end
