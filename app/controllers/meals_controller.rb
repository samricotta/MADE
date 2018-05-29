class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def new
  end

  def edit
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :description, :ingredients, :portions_left, :photo, :cuisine, :dietary)
  end
end
