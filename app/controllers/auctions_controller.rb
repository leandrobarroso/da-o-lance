class AuctionsController < ApplicationController
  def index
    @auctions = Auction.where(user_id: current_user.id)
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
      redirect_to auctions_path
    else
      render :new
    end
  end

  def show
    @auction = Auction.find(params[:id])

  end

  private

  def auction_params
    params
      .require(:auction)
      .permit(:list_name, :deadline, :status, auction_products_attributes: AuctionProduct.attribute_names.map(&:to_sym).push(:_destroy))
  end
end
