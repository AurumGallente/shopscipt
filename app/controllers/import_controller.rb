class ImportController < ApplicationController 

  def show
    
  end
  
  
 def import
   params[:file].inspect
 end
 
 private
     def product_params
      params.permit(:file)
    end
  
 

end