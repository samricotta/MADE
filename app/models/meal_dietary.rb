class MealDietary < ApplicationRecord
  belongs_to :meal
  belongs_to :dietary
end
