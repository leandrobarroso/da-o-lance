class AddPriceToBids < ActiveRecord::Migration[6.0]
  def change
    add_monetize :bids, :price, currency: { present: false }
  end
end
