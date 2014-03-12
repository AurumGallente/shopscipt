class DropCharactericticTable < ActiveRecord::Migration
  def change
    drop_table :characterictics
  end
end
