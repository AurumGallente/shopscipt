class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :title
      t.string :description
      t.text :text

      t.timestamps
    end
  end
end
