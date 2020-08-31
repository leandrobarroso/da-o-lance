class CreateSellers < ActiveRecord::Migration[6.0]
  def change
    create_table :sellers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :adress

      t.timestamps
    end
  end
end
