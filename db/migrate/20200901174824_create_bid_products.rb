class CreateBidProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :bid_products do |t|
      t.references :bid, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.float :unit_price

      t.timestamps
    end
  end
end
