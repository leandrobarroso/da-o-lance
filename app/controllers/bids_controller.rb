class BidsController < ApplicationController
  def index
    @auctions = Auction.where(user: current_user)
    @bids = @auctions.map do |auction|
      Bid.where(auction: auction)
    end.flatten
    # @bids = Bid.where(seller_id: current_user.id)
  end

  def show
    @bid = Bid.find(params[:id])
  end

  def new
    @auction = Auction.find(params[:auction_id])
    @seller = current_user.seller
    if @seller.auctions.include? @auction
      redirect_to edit_bid_url(@seller.bids.find_by(auction: @auction))
    else
      @bid = Bid.create(auction: @auction, seller: @seller)
      @auction.auction_products.each do |auct_product|
        BidProduct.create(bid: @bid, product: auct_product.product, quantity: auct_product.quantity)
      end
      redirect_to edit_bid_url(@bid)
    end
  end

  def edit
    @bid = Bid.find(params[:id])
  end

  def update
    @bid = Bid.find(params[:id])
    @auction = @bid.auction
    if @bid.update(bid_params)
      @bid.total = @bid.total_price
      @bid.save
      AuctionChannel.broadcast_to(
        @auction,
        [render_to_string(partial: "bid", locals: { bid: @bid }), @auction.bids.count]
      )
      redirect_to @bid.seller, notice: 'bid was successfully updated.'
    else
      render :edit
    end
  end

  private

  def bid_params
    params.require(:bid).permit!
  end
end
