class User < ApplicationRecord
  has_many :orders
  has_many :meal_reviews
  has_many :meals, dependent: :destroy
  has_many :meal_orders, through: :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader

end
