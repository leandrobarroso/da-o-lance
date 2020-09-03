class OrdersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    bid = Bid.find(params[:bid_id])
    order = Order.create!(bid: bid)

    session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: bid.auction.list_name,

      amount: bid.total,
      currency: 'brl',
      quantity: 1
    }],
    success_url: order_url(order),
    cancel_url: order_url(order)
  )

    order.update(checkout_session_id: session.id)
    redirect_to order_path(order)
  end
end
