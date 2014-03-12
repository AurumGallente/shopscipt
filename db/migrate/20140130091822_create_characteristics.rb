class CreateCharacteristics < ActiveRecord::Migration
  def change
    create_table :characteristics do |t|
      t.integer :characteristicable_id
      t.string :characteristicable_type

      t.timestamps
    end
  end
end
