class BidsController < ApplicationController
  def index
    @bids = Bid.where(seller_id: current_user.id)
  end

  def show
    @bid = Bid.find(params[:id])
  end

  def new
    @auction = Auction.find(params[:auction_id])
    @seller = Seller.find(params[:seller_id])
    @bid = Bid.create(auction: @auction, seller: @seller)
    @auction.auction_products.each do |auct_product|
      BidProduct.create(bid: @bid, product: auct_product.product, quantity: auct_product.quantity)
    end
    redirect_to edit_bid_url(@bid)
  end

  # def create
  #   @bid = Bid.new(bid_params)
  #   @bid.status = "SEM STATUS AINDA"
  #   @seller = current_user.seller
  #   @auction = Auction.find(params[:auction_id])
  #   @bid.seller = @seller
  #   @bid.auction = @auction

  #   if @bid.save
  #     redirect_to seller_url(@seller)
  #   else
  #     render :new
  #   end
  # end

  def edit
    @bid = Bid.find(params[:id])
  end

  def update
    @bid = Bid.find(params[:id])
    if @bid.update(bid_params)
      redirect_to @seller, notice: 'bid was successfully updated.'
    else
      render :new
    end
  end

  def destroy
  end

  private

  def bid_params
    params.require(:bid).permit(:total, :status)
  end

end
