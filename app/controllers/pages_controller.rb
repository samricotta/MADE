class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @top_chef = User.all.sample
    @four_meals = Meal.where(user: @top_chef).first(4)
    @six_meals = Meal.last(6)
  end

  def dashboard
    @meals = current_user.meals
  end

end
