class BidsController < ApplicationController
  def index
    @bids = Bid.where(seller_id: current_user.id)
  end

  def show
    @bid = Bid.find(params[:id])
  end
end
