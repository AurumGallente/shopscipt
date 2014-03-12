class AddSeoToProducts < ActiveRecord::Migration
  def change
    add_column :products, :title, :string
    add_column :products, :description, :string
    add_column :products, :h1, :string
    add_column :products, :keywords, :string
    add_column :products, :seolink, :string
  end
end
