class User < ApplicationRecord
  has_many :orders
  has_many :meal_reviews
  has_many :meals
  has_many :meal_orders, through: :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
