class Product < ApplicationRecord
  has_many :auction_products
  has_many :bid_products
  has_one_attached :photo
end
