class Auction < ApplicationRecord
  belongs_to :user
  has_many :auction_products
end
