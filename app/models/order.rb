class Order < ApplicationRecord
  belongs_to :user
  has_many :meal_orders
  has_many :meals, through: :meal_orders
  monetize :amount_cents

  def total_items
    sum = 0
    meal_orders.each do |mo|
      sum += mo.quantity
    end
    return sum
  end
end
