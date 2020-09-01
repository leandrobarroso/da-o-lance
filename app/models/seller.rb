class Seller < ApplicationRecord
  belongs_to :user
  has_many :bids
  has_many :orders
end
