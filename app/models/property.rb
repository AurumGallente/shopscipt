class Property < ActiveRecord::Base
  has_and_belongs_to_many :characteristics
  mount_uploader :image, PropertyUploader
end
