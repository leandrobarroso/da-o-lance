class AuctionProduct < ApplicationRecord
  belongs_to :auction, optional: true
  belongs_to :product

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 1000 }
end
