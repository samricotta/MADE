class MealReviewsController < ApplicationController

  def create
    @meal = Meal.find(params[:meal_id])
    @meal_review = MealReview.new(meal_review_params)
    @meal_review.meal = @meal
    @meal_review.user = current_user
    if @meal_review.save
      redirect_to meal_path(@meal)
    else
      raise
      render "meals/show"
    end
  end

  private

  def meal_review_params
    params.require(:meal_review).permit(:rating, :comment, :speed, :quality, :portion_size)
  end
end
