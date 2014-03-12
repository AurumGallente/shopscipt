class RemoveSeolink < ActiveRecord::Migration
  def change
    remove_column :products, :seolink
  end
end
