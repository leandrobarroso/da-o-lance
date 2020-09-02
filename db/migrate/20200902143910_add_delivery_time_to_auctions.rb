class AddDeliveryTimeToAuctions < ActiveRecord::Migration[6.0]
  def change
    add_column :auctions, :delivery_time, :datetime
  end
end
