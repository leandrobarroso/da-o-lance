class CreateBids < ActiveRecord::Migration[6.0]
  def change
    create_table :bids do |t|
      t.references :auction, null: false, foreign_key: true
      t.references :seller, null: false, foreign_key: true
      t.integer :total
      t.string :status

      t.timestamps
    end
  end
end
