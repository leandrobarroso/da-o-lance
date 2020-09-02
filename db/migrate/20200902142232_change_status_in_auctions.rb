class ChangeStatusInAuctions < ActiveRecord::Migration[6.0]
  def change
    remove_column :auctions, :status
    add_column :auctions, :status, :boolean
    change_column_default :auctions, :status, from: true, to: false
  end
end
