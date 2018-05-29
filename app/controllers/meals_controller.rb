class MealsController < ApplicationController

  skip_before_action :authenticate_user!, only: :index

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
  end

  def new
  end

  def edit
  end
end
