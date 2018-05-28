class Meal < ApplicationRecord
  belongs_to :user
  has_many :meal_orders
  has_many :meal_reviews
  has_many :orders, through: :meal_orders
end
