class AuctionsController < ApplicationController

  def index
    @auctions = Auction.all
  end

  def new
    @auction = Auction.new
    @products = Product.all
    @auction_product = AuctionProduct.new
  end

  def create
    @auction = Auction.new(auction_params)
    @auction.user = current_user
    @auction.deadline = DateTime.now
    @seleted_products = params[:products]
  unless @selected_products.empty?
    @auction.save
    @selected_products.each do |product|
    AuctionProduct.create(auction: @auction, product_id: product[:id], quantity: product[:quantity] )
  end
    redirect ??
  else
    render :new
  end
  end
end
  private

  def auction_params
    params.require(:auctions).permit(:status, :deadline, :product_id, :quantity)
  end
