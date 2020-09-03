class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @auction = Auction.find(params[:auction_id])
    @order = Order.find(params[:order_id])

  end

end
