class Product < ActiveRecord::Base
  
  extend FriendlyId
  
  belongs_to :category
  has_one :characteristic, :as => :characteristicable, :dependent => :destroy
  has_many :properties
  has_many :images, :as => :imageable, :dependent => :destroy, :autosave => true
  friendly_id :article, use: [:slugged, :history]
  accepts_nested_attributes_for :characteristic
  accepts_nested_attributes_for :images
  validates_presence_of :article, :dealerprice, :largeprice, :smallprice, :stopprice, :retailprice, :name, :dealercount, :largecount, :smallcount, :retailcount, :stopcount
  validates :article, uniqueness: true
  
  
  def should_generate_new_friendly_id?
    slug.blank? || article_changed?
  end

  
  def self.import(file)   
    spreadsheet = open_spreadsheet(file)
    info = Hash.new
    set = {:dealerprice => 'D', :largeprice => 'F', :smallprice => 'H', :stopprice => 'L', :retailprice => 'J'}
    set2 = {:article => 'C', :name => 'B', :dealercount => 'E', :largecount => 'G', :smallcount => 'I', :retailcount => 'K', :stopcount => 'M'}  
    last_row = spreadsheet.last_row
    (12..last_row).each do |i|
       article = spreadsheet.cell('C', i).to_s.strip
       info = assigning(set, spreadsheet, i, info)
       if (article != '')
        @product = Product.where(:article => article).first
        if !@product.blank?            
              @product.update(info)
        else
            set.merge!(set2) 
              info = assigning(set, spreadsheet, i, info)
              #info[:seolink] = Russian.translit(article.gsub(/\s+/, "_"))
              @product = Product.new(info)
              @product.save
        end
       end     
    end 
   end
 
   
  private
  def self.open_spreadsheet(upload)
    directory = "public/uploads"
    path = File.join(directory, upload)
    File.open(path, "r") {|file|
    case File.extname(file)
      when ".csv" then s = Csv.new(file.path, nil, :ignore)
      when ".xls" then s = Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then s = Roo::Excelx.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
    return s
    }
  end
  
   
  def self.cell_read(spreadsheet, key, cell, i, arr)
    arr[key] = spreadsheet.cell(cell, i)
    if arr[key].kind_of?(String)
      arr[key] = arr[key].strip
    end
    return arr    
  end
  
  def self.assigning(set, spreadsheet, i, info)
       newinfo = Hash.new
       set.each do |key, value|
        newinfo = cell_read(spreadsheet, key, value, i, info)
       end  
       return newinfo
  end
  
end
