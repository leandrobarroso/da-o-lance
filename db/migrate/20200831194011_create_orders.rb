class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :seller, null: false, foreign_key: true
      t.references :bid
      t.float :total

      t.timestamps
    end
  end
end
