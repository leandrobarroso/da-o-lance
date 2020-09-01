class RemoveTimeInAuctions < ActiveRecord::Migration[6.0]
  def change
    change_table :auctions do |t|
      t.remove :deadline
      t.rename :time, :deadline
    end
  end
end
