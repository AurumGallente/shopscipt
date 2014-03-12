class RemoveUnusedColomns < ActiveRecord::Migration
remove_column :products, :large
remove_column :products, :count
end
