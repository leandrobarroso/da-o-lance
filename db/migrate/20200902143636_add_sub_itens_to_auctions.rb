class AddSubItensToAuctions < ActiveRecord::Migration[6.0]
  def change
    add_column :auctions, :sub_itens, :boolean, default: false
  end
end
