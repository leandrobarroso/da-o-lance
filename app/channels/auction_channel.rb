class AuctionChannel < ApplicationCable::Channel
  def subscribed
    auction = Auction.find(params[:id])
    stream_for auction
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
