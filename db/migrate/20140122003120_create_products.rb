class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :article
      t.float :dealerprice
      t.string :dealercount
      t.float :largeprice
      t.string :large
      t.string :count
      t.float :smallprice
      t.string :smallcount
      t.float :retailprice
      t.string :retailcount

      t.timestamps
    end
  end
end
