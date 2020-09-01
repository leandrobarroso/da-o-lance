class RemoveTotalFromOrders < ActiveRecord::Migration[6.0]
  def change
    change_table :orders do |t|
      t.remove :total
    end
  end
end
