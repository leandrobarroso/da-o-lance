class Auction < ApplicationRecord
  belongs_to :user
  has_many :auction_products, dependent: :destroy
  has_many :products, through: :auction_products
  has_many :bids
  accepts_nested_attributes_for :auction_products, allow_destroy: true, reject_if: proc { |att| att['quantity'].blank? }
  validates :deadline, :list_name, presence: true

end
