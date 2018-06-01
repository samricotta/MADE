class MealsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_meal, only: [:edit, :update, :show, :destroy]

  def index
    @dietaries = Dietary.all
    # filter method is in the Meal model file
    @meals = Meal.filter(params) # is params as the keyword?

    @markers = @meals.map do |meal|
      if meal.user.latitude.present? && meal.user.longitude.present?
        {
          lat: meal.user.latitude,
          lng: meal.user.longitude#,
          # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
        }
      end
    end

  end

  def show
    @order = Order.where(user: current_user, status: "pending")
    @meal_review = MealReview.new
    @meal = Meal.find(params[:id])
    @meal_order = MealOrder.new
  end

  def edit
    # i need the dietaries
    @dietaries = Dietary.all

  end

  def update
    old_dietary_ids = @meal.dietaries.map(&:id) # short cut for iteration (.id is a method)
    dietary_ids = params[:meal][:meal_dietaries][:dietaries].map(&:to_i)
    dietary_ids.delete(0)
    (old_dietary_ids - dietary_ids).each do |id|
      dietary = Dietary.find(id)
      MealDietary.where(meal: @meal, dietary: dietary).first.destroy
    end
    dietary_ids.each do |dietary_id|
      dietary = Dietary.find(dietary_id)
      MealDietary.create!(meal: @meal, dietary: dietary) unless @meal.dietaries.include?(dietary)
    end
    @meal.update(meal_params)
    redirect_to meal_path(@meal)
  end

  def new
    @meal = Meal.new
    @dietaries = Dietary.all
  end

  def create
    @meal = Meal.new(meal_params)
    dietary_ids = params[:meal][:meal_dietaries][:dietaries]
    dietary_ids.delete('')
    @meal.user = current_user
    if @meal.save
      dietary_ids.each do |dietary_id|
        dietary = Dietary.find(dietary_id)
        MealDietary.create!(meal: @meal, dietary: dietary)
      end
      redirect_to meal_path(@meal)
    else
      # raise
      render :new
    end
  end

  def destroy
    @meal.destroy
    redirect_to dashboard_path
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :description, :ingredients, :portions_left, :cuisine, :dietary, :photo)
  end

  def set_meal
    @meal = Meal.find(params[:id])
  end


end







