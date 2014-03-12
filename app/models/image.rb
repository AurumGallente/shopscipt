class Image < ActiveRecord::Base
  
  belongs_to :imageable, :polymorphic => true
  mount_uploader :image, PropertyUploader

  #validates_presence_of :image
  
end
