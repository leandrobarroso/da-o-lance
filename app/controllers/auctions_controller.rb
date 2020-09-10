class AuctionsController < ApplicationController
  def index
    @auctions = policy_scope(Auction).where(user_id: current_user.id)
  end

  def new
    @auction = Auction.new
    @products = Product.all
    @auction_product = AuctionProduct.new
    authorize @auction
  end

  def create
    @products = Product.all
    @auction = Auction.new(auction_params)
    @auction.user = current_user
    authorize @auction
    if @auction.save
      redirect_to auctions_path
    else
      render :new
    end
  end

  def show
    @auction = Auction.find(params[:id])
    authorize @auction
  end

  private

  def auction_params
    params
      .require(:auction)
      .permit(:delivery_time, :list_name, :deadline, :status, auction_products_attributes: AuctionProduct.attribute_names.map(&:to_sym).push(:_destroy))
  end
end
