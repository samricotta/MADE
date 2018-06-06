class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @users = @order.meal_orders.map(&:meal).map(&:user).uniq!.reject { |user| user.latitude.nil? && user.longitude.nil? }
      # @order = Order.where(user: current_user, status: "pending").first
    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def create
  end

  private

  def order_params
    params.require(:order).permit(:status, :pick_up_time, :pick_up_date, :user_id)
  end
end
