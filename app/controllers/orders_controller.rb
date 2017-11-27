class OrdersController < ApplicationController

  def create
    permitted = params.require(:order).permit(:tickets, :activity_id)
    @order = Order.new(permitted)
    @order.user = current_user
    @activity = @order.activity

    if @order.save
      redirect_to @order
    else
      redirect_to @activity
    end
  end

  def show
    @order = current_user.orders.find_by_id(params[:id])
    if @order == nil
      flash[:alert] = "There is no such order."
      redirect_to :root
    else
      @activity = @order.activity
    end

  end

  def index
    @orders = current_user.orders
  end

end
