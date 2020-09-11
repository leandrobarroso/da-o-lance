class Product < ApplicationRecord
  has_many :auction_products
  has_many :bid_products
  has_one_attached :photo

  validates :description, length: { in: 5..75 }
  validates :category, length: { in: 5..50 }
end
