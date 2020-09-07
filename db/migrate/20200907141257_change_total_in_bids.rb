class ChangeTotalInBids < ActiveRecord::Migration[6.0]
  def change
    change_column :bids, :total, :float
  end
end
