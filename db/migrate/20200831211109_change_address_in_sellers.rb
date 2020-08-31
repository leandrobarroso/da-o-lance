class ChangeAddressInSellers < ActiveRecord::Migration[6.0]
  def change
    change_table :sellers do |t|
      t.rename :adress, :address
    end
  end
end
