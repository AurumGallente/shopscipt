 class UploadController < ApplicationController
  def new

  end

  def create
    if (!params[:upload].nil?)
      name = params[:upload][:file].original_filename
      directory = "public/uploads"
      path = File.join(directory, name)
      File.open(path, "wb") { |f| f.write(params[:upload][:file].read) }
      flash[:notice] = "File uploaded"
      Product.import(params[:upload][:file].original_filename)
    else 
      flash[:notice] = 'File was not uploaded'
      redirect_to upload_path
    end    
    #redirect_to upload_path
  end
end