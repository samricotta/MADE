# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
MealOrder.destroy_all
MealReview.destroy_all
Order.destroy_all
User.destroy_all
Meal.destroy_all
MealDietary.destroy_all
Dietary.destroy_all

# creating dietaries list
dietaries = [ "Halal", "Kosher", "Vegetarian", "Vegan", "Pescatarian", "Diary Free", "Nut Free", "Gluten Free", "Egg Free" ]
dietaries.each do |dietary|
  d = Dietary.create(name: dietary)
  puts "Created #{d.name}"
end


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
      cuisine: "French",
      user: user,
      price: 5
    )
    dietary_names = dietaries.sample(2)
    Dietary.where(name: dietary_names).each do |dietary|
      MealDietary.create!(meal: meal, dietary: dietary)
    end
  end
    3.times do
    description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit error a quidem at quisquam, autem."
    meal = Meal.create!(
      name: Faker::Food.dish,
      description: description,
      ingredients: "#{(Faker::Food.ingredient)}, " * 5,
      user: user,
      price: 10,
      cuisine: "Italian"

    )
    dietary_names = dietaries.sample(2)
    Dietary.where(name: dietary_names).each do |dietary|
      MealDietary.create!(meal: meal, dietary: dietary)
    end
  end
end
