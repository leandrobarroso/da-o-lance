class Seller < ApplicationRecord
  belongs_to :user
  has_many :bids
  has_many :auctions, through: :bids
  has_one_attached :photo
  validates :name, :address, presence: true
end
