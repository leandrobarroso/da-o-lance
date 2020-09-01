class BidProduct < ApplicationRecord
  belongs_to :bid
  belongs_to :product
end
