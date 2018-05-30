class Meal < ApplicationRecord
  belongs_to :user
  has_many :meal_orders
  has_many :meal_reviews
  has_many :meal_dietaries, dependent: :destroy
  has_many :orders, through: :meal_orders
  monetize :price_cents
  has_many :dietaries, through: :meal_dietaries

  mount_uploader :photo, PhotoUploader

end
