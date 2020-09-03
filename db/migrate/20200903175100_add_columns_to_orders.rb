class AddColumnsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :checkout_session_id, :string
    add_column :orders, :quantity, :integer
  end
end
