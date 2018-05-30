class MealOrdersController < ApplicationController
  def create
    # see if there is an order with status pending and my user id
    # if yes link meal order to the order
    @meal_order = MealOrder.new(meal_order_params)
    @meal = Meal.find(params[:meal_id])
    @meal_order.meal = @meal

    @order = Order.where(user: current_user, status: "pending").first
    if @order.nil?
      @meal_order.order = @order
    else
    # if not Order.new
      @order = Order.new
      @order.status = 'pending'
      @order.user = current_user
      @order.save
      @meal_order.order = @order
      @meal_order.save
    end

    # update the total amount of order depending on what was added
    @order.amount = @order.amount + @meal.price
    @order.save

    # raise
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
