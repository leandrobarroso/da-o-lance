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
    #@seleted_products = params[:products]
    @product = Product.find(params[:products])


    unless @product.nil?
      @auction.save

      AuctionProduct.create(auction: @auction, product: @product, quantity: product[:quantity])

      redirect root_path
    else
      render :new
    end
  end

  private

  def auction_params
    params.require(:auction).permit(:status, :deadline, :product_id, :quantity)
  end
end
