class AuctionProduct < ApplicationRecord
  belongs_to :auction, optional: true
  belongs_to :product
end
