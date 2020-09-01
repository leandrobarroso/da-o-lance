class ChangeTimeInAuctions < ActiveRecord::Migration[6.0]
  def change
    change_table :products do |t|
      t.remove :deadline
    end
  end
end
