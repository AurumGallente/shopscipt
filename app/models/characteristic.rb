class Characteristic < ActiveRecord::Base
  belongs_to :characteristicable, :polymorphic => true
  has_and_belongs_to_many :properties
  
end
