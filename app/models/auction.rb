class Auction < ApplicationRecord
  belongs_to :user
  has_many :auction_products
  has_many :products, through: :auction_products
  accepts_nested_attributes_for :auction_products
end
