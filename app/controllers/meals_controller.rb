class MealsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user
    if @meal.save
      redirect_to meal_path(@meal)
    else
      # raise
      render :new
    end
  end

private
  def meal_params
    params.require(:meal).permit(:name, :description, :ingredients, :portions_left, :cuisine, :dietary)
  end

end


