class AddListNameToAuctions < ActiveRecord::Migration[6.0]
  def change
    add_column :auctions, :list_name, :string
  end
end
