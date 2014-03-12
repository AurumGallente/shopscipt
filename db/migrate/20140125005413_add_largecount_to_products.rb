class AddLargecountToProducts < ActiveRecord::Migration
  def change
        add_column :products, :largecount, :string
  end
end
