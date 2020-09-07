class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :seller
  monetize :price_cents
  has_many :auction_products, through: :auction
  has_many :bid_products
  validates :seller, uniqueness: { scope: :auction, message: "only one bid per seller" }

  accepts_nested_attributes_for :bid_products

  def total_price
    total_price = 0.00
    bid_products.each do |bid_product|
      total_price += bid_product.quantity * bid_product.unit_price
    end
    total_price
  end
end
