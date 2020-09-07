class BidProduct < ApplicationRecord
  belongs_to :bid
  belongs_to :product

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 1000 }
  validates :unit_price, presence: true, numericality: { greater_than_or_equal: 0, less_than_or_equal_to: 1000000 }
end
