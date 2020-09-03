class OrdersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end
end
