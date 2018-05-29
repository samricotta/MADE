class MealOrdersController < ApplicationController
  def create
    # see if there is an order with status pending and my user id
    # if yes link meal order to the order
    @meal_order = MealOrder.new(meal_order_params)
    @meal_order.meal_id = params[:meal_id]

    @test = Order.where(user: current_user, status: "pending")
    if @test.exists?
      @meal_order.order_id = Order.find(user: current_user, status: "pending")
    else
    # if not Order.new
    @order = Order.new
    @order.user = current_user
    @order.save
    @meal_order.order_id = @order.id
    end

    if @meal_order.save
      redirect_to meals_path
    else
      redirect_to meal_path(@meal_order.meal)
    end
  end

  def meal_order_params
    params.require(:meal_order).permit(:quantity, :order_id, :meal_id)
  end
end
