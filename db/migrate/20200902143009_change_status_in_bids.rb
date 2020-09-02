class ChangeStatusInBids < ActiveRecord::Migration[6.0]
  def change
    remove_column :bids, :status
    add_column :bids, :status, :boolean
    change_column_default :bids, :status, from: true, to: false
  end
end
