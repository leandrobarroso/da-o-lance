class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :seller
  has_many :auction_products, through: :auction
end
