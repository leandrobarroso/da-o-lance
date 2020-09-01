class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :seller
  has_many :bid_products

  accepts_nested_attributes_for :bid_products

  def total_price
    total_price = 0
    bid_products.each do |bid_product|
      total_price += bid_product.quantity * bid_product.unit_price
    end
    total_price
  end
end
