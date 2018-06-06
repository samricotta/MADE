class User < ApplicationRecord
  has_many :orders
  has_many :meal_reviews
  has_many :meals, dependent: :destroy
  has_many :meal_orders, through: :orders
  has_many :messages

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader

  def average_rating
    total = 0
    number_of_reviews = 0
    meals.each do |meal|
      meal.meal_reviews.each do |review|
        total += review.rating
        number_of_reviews += 1
      end
    end
    if number_of_reviews == 0
      return 0
    else
      average = total/number_of_reviews
      return average
    end
  end

end
