class CreateAuctions < ActiveRecord::Migration[6.0]
  def change
    create_table :auctions do |t|
      t.integer :time
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
