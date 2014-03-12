class Category < ActiveRecord::Base

  has_ancestry :orphan_strategy => :adopt
  has_many :products
  has_one :characteristic, :as => :characteristicable, :dependent => :destroy
  has_one :image, :as => :imageable, :dependent => :destroy
  accepts_nested_attributes_for :characteristic
  accepts_nested_attributes_for :image
  scope :no_parent, where(:ancestry =>  nil)
  scope :has_parent, where("ancestry <> ''")
  
  validates :name, presence: true


  def self.excluded_select(id)

    node = Category.where('id = ?', id).first
    nodes = node.subtree.to_ary
    all_cats = Category.all.to_ary
    nodes.each do |n|
      all_cats.delete(n)
    end
    return all_cats
  end


  def ancestry_name
    node = Category.where('id = ?', self.parent_id).first
    if node
        return node.name
    else
        return 'no parent'
    end

  end

end