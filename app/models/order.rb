class Order < ApplicationRecord
  belongs_to :bid
  monetize :amount_cents
end
