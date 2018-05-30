class OrdersController < ApplicationController

  def show
      @order = Order.where(user: current_user, status: "pending").first
  end

  def create

  end
end
