class AddUniqueIndexToProductArticle < ActiveRecord::Migration
  def change
    add_index :products, [:article], :unique => true
  end
end
