class OrdersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    puts "*************************** #{@order.bid.status} ****************"
    authorize @order
  end

  def create
    bid = Bid.find(params[:bid_id])
    bid.change_status
    order = Order.create!(bid: bid, amount: bid.total)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: bid.auction.list_name,
        amount: order.amount_cents,
        currency: 'brl',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
    authorize Order
  end
end
