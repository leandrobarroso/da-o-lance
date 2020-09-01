class Seller < ApplicationRecord
  belongs_to :user
  has_many :bids
  validates :name, :address, presence: true
end
