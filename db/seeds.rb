require "faker"

Item.destroy_all

Category.destroy_all

Store.destroy_all

1.times do
  store = Store.create(
    name: "Café Coffee Day",
    address: "21 McPhillips",
    email: "meharsahil207@gmail.com"
  )

10.times do

 category = Category.create(

    name: Faker::Coffee.variety,
    store_id: 1

  )

  5.times do

    items = Item.create(
        name: Faker::Coffee.blend_name,
        price: Faker::Commerce.price,
        category_id: Faker::Number.between(from: 1, to: 10),
        store_id: 1

    )

  end
end

endAdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?