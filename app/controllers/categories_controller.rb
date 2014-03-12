class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  


  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @my_array = Category.all
    @category = Category.new
    @characteristic =  @category.build_characteristic 
    @image = @category.build_image
  end

  # GET /categories/1/edit
  def edit
        
        @characteristic = @category.characteristic
        
        if @category.image.nil?
          @image = @category.build_image
        else          
          @image = @category.image
        end
    
        
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    @characteristic =  @category.build_characteristic
    if @category.image.nil?
      @image = @category.build_image
    else          
      @image = @category.image
    end
    respond_to do |format|
      if @category.save
        @characteristic.update(characteristic_params)
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @category }
      else
        format.html { render action: 'new' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    @characteristic = @category.characteristic
    if @category.image.nil?
      @image = @category.build_image
    else          
      @image = @category.image
    end
    respond_to do |format|
      if @category.update(category_params)
        @characteristic.update(characteristic_params)
    
        
        format.html { redirect_to @category, notice:  'saved' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
      @my_array = Category.excluded_select(params[:id])
    end
    


    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :title, :description,  :text, :parent_id, :characteristic_attributes =>[:id], :image_attributes => [:id ,:image, :remote_image_url, :remove_image])
    end
    
    def characteristic_params
      params.require(:characteristic).permit( { :property_ids => []})
    end
    
    def image_params
      params.require(:image_attributes).permit(:image, :remote_image_url) if params[:image_attributes]
    end


end