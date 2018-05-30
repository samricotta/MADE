class Order < ApplicationRecord
  belongs_to :user
  has_many :meal_orders
  has_many :meals, through: :meal_orders
  monetize :amount_cents
end
