class ChangeDeadlineInAuctions < ActiveRecord::Migration[6.0]
  def change
    change_table :auctions do |t|
      t.datetime :time
    end
  end
end
