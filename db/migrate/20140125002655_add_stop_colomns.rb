class AddStopColomns < ActiveRecord::Migration
  def change
    add_column :products, :stopprice, :float
    add_column :products, :stopcount, :string
  end
end
