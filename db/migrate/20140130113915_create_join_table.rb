class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :characteristics, :properties do |t|
       t.index [:characteristic_id, :property_id], :unique => true, :name => 'cp_index1'
       t.index [:property_id, :characteristic_id], :unique => true, :name => 'cp_index2'
    end
  end
end
