class Dietary < ApplicationRecord
  has_many :meal_dietaries
  has_many :meals, through: :meal_dietaries
end
