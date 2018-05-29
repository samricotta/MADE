class MealsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:location]
      @meals = User.where("address iLIKE ?", "%#{params[:location]}%").where.not(latitude: nil, longitude: nil).map { |user| user.meals }.flatten
    else
      @meals = User.where.not(latitude: nil, longitude: nil).map { |user| user.meals }.flatten
    end

    @markers = @meals.map do |meal|
      {
        lat: meal.user.latitude,
        lng: meal.user.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def show
    @meal = Meal.find(params[:id])
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


