# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
User.destroy_all

# create users
# assign 5 meals per user
20.times do
 user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    password: "123456",
    address: Faker::Address.full_address
  )
  3.times do
    description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit error a quidem at quisquam, autem."
    meal = Meal.create!(
      name: Faker::Food.dish,
      description: description,
      ingredients: "#{(Faker::Food.ingredient)}, " * 5,
      dietary: "Gluten Free",
      cuisine: "French",
      user: user
    )
  end
    3.times do
    description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit error a quidem at quisquam, autem."
    meal = Meal.create!(
      name: Faker::Food.dish,
      description: description,
      ingredients: "#{(Faker::Food.ingredient)}, " * 5,
      dietary: "Dairy Free",
      cuisine: "Italian",
      user: user
    )
  end
end
