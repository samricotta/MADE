class MealOrdersController < ApplicationController
  def create
    # see if there is an order with status pending and my user id
    # if yes link meal order to the order
    @meal = Meal.find(params[:meal_id])
    @meal_order = MealOrder.new(meal_order_params)
    @meal_order.meal = @meal

    @order = Order.where(user: current_user, status: "pending").first
    if @order.present?
      @meal_order.order = @order
    else
    # if not Order.new
      @order = Order.new
      @order.user = current_user
      @order.save
      @meal_order.order = @order
    end

    if @meal_order.save
      redirect_to order_path(@order)
    else
      redirect_to meal_path(@meal_order.meal)
    end
  end

  def meal_order_params
    params.require(:meal_order).permit(:quantity, :order_id, :meal_id)
  end
end
