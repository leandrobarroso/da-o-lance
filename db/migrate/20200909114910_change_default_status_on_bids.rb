class ChangeDefaultStatusOnBids < ActiveRecord::Migration[6.0]
  def change
    remove_column :bids, :status
    add_column :bids, :status, :boolean
  end
end
