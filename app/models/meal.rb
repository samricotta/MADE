class Meal < ApplicationRecord
  belongs_to :user
  has_many :meal_orders
  has_many :meal_reviews
  has_many :meal_dietaries, dependent: :destroy
  has_many :orders, through: :meal_orders
  monetize :price_cents
  has_many :dietaries, through: :meal_dietaries
  mount_uploader :photo, PhotoUploader


  validates :name, presence: true
  validates :description, presence: true
  validates :ingredients, presence: true
  validates :price_cents, numericality: { greater_than: 0 }
  validates :portions_left, numericality: { greater_than: 0 }





  def ordered_and_not_reviewed?(user)
    # is it order?
    ordered = self.orders.select { |order| order.status == "paid" }.map(&:user_id).include?(user.id)
    # is it reviewed already
    reviewed = self.meal_reviews.map(&:user_id).include?(user.id)
    return ordered && !reviewed
  end

  def self.filter(args)
    dietary = args[:dietary]
    cuisine = args[:cuisine]
    location = args[:location]

    # if location
    #   @meals = User.where("address iLIKE ?", "%#{location}%").map { |user| user.meals }.flatten
    # end

    # 1. search for cuisine, dietary and location togheter
    if cuisine.present? && dietary.present? && location.present?
      arr_cuis = where("cuisine iLIKE ?", "%#{cuisine}%")
      arr_diet = MealDietary.where(dietary_id: dietary).map { |md| md.meal }
      arr_loc = User.near(location, 5).map { |user| user.meals }.flatten
      return arr_cuis & arr_diet & arr_loc
    # 2. when search for cuisine and dietary togheter
    elsif cuisine.present? && dietary.present?
      arr_cuis = where("cuisine iLIKE ?", "%#{cuisine}%")
      arr_diet = MealDietary.where(dietary_id: dietary).map { |md| md.meal }
      return arr_cuis & arr_diet
    # 3. when search for location and dietary togheter
    elsif location.present? && dietary.present?
      arr_loc = User.near(location, 5).map { |user| user.meals }.flatten
      arr_diet = MealDietary.where(dietary_id: dietary).map { |md| md.meal }
      return arr_loc & arr_diet
    # 4. when search for location and cuisine togheter
    elsif location.present? && cuisine.present?
      arr_loc = User.near(location, 5).map { |user| user.meals }.flatten
      arr_cuis = where("cuisine iLIKE ?", "%#{cuisine}%")
      return arr_loc & arr_cuis
    # 5. when search for cuisine only
    elsif cuisine.present?
      return where("cuisine iLIKE ?", "%#{cuisine}%")
    # 6. when search for dietary only
    elsif dietary.present?
      return MealDietary.where(dietary_id: dietary).map { |md| md.meal }
    # 7. only location
    elsif location.present?
      return User.near(location, 5).map { |user| user.meals }.flatten
    # 8. if no filter searched
    else
      return all
    end
  end

end
