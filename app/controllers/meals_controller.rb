class MealsController < ApplicationController

  skip_before_action :authenticate_user!, only: :index
  def index
    if params[:location]
      @meals = User.where("address iLIKE ?", "%#{params[:location]}%").where.not(latitude: nil, longitude: nil).map { |user| user.meals }.flatten
    else
      @meals = User.where.not(latitude: nil, longitude: nil).map { |user| user.meals }.flatten
    end
  end

  def show
  end

  def new
  end

  def edit
  end
end
