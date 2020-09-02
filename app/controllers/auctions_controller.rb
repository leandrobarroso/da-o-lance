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

    if @auction.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def auction_params
    params
      .require(:auction)
      .permit(:deadline, :status, auction_products_attributes: AuctionProduct.attribute_names.map(&:to_sym).push(:_destroy))
  end
end
