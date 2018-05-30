class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])

  end

  private
  def order_params
    params.require(:order).permit(:status, :pick_up_time, :pick_up_date, :user_id)
  end
end
