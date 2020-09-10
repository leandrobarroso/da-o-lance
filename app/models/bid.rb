class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :seller
  monetize :price_cents
  has_many :auction_products, through: :auction
  has_many :bid_products
  validates :seller, uniqueness: { scope: :auction, message: "only one bid per seller" }
  validates :total, presence: true, numericality: { greater_than_or_equal: 0.00, less_than_or_equal_to: 1_000_000.00 }
  # validates :bid_products, presence: true

  accepts_nested_attributes_for :bid_products

  def total_price
    total_price = 0.00
    bid_products.each do |bid_product|
      total_price += bid_product.quantity * bid_product.unit_price
    end
    total_price
  end
end
