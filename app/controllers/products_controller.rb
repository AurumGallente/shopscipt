class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :primary, :destroy_from_products]

  def import
   Product.import(params[:file])
   redirect_to root_url, notice: "decorations imported."
  end
  
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    if request.path != product_path(@product)
      redirect_to @product, status: :moved_permanently
    end
  end

  # GET /products/new
  def new
    @product = Product.new
    @characteristic =  @product.build_characteristic
    @images = @product.images.build
  end

  # GET /products/1/edit
  def edit
     @images = @product.images.build
    if @product.characteristic.nil?
      @characteristic =  @product.build_characteristic
    else
      @characteristic = @product.characteristic
    end
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    #@images = @product.images.build
    @characteristic =  @product.build_characteristic
    respond_to do |format|
      if @product.save
        #flash.notice = params[:product][:images_attributes].inspect
        @characteristic.update(characteristic_params)
        if params[:product][:images_attributes]
          params[:product][:images_attributes].each do |i|
             @product.images.build(:image =>i).save          
          end
        end        
        format.html { redirect_to @product, notice: 'created' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new', notice: 'not created' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    #@images = @product.images.build(image_params)
    if @product.characteristic.nil?
      @characteristic =  @product.build_characteristic
    else
      @characteristic = @product.characteristic
    end
    respond_to do |format|
      if @product.update(product_params)
        @characteristic.update(characteristic_params)
        #@product.images.update(image_params)
        #flash.notice = params[:product][:images_attributes].inspect
        if params[:product][:images_attributes]
          params[:product][:images_attributes].each do |i|
             @product.images.build(:image =>i).save          
          end
        end
        
        format.html { redirect_to @product, notice: 'updated' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', notice: 'not updated' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  def destroy_from_products
    @image = Image.where(:id => params[:image_id]).first
    @image.destroy
   respond_to do |format|
      format.html { redirect_to images_url }
      format.json { head :no_content }
      format.js { render action: 'destroy_from_products'}
    end
  end  
  
  
  def primary
    @image = Image.where(:id => params[:product][:images_attributes]).first
    @product.images.each do |i|
      i.update(:primary => false)
    end
    @image.primary = true
    if @image.save
        respond_to do |format|
                  format.html { redirect_to @product, notice: 'updated' }
                  
                  format.js { render action: 'primary'}
        end
    end
  end
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :text, :article, :dealerprice, :dealercount, :largeprice, :largecount, :smallprice, :smallcount, :retailprice, :retailcount, :stopprice, :stopcount, :title, :description, :h1, :keywords, :category_id, :characteristic_attributes =>[:id], :images_attributes => [:id ,:image])
    end
    
    def characteristic_params
      params.require(:characteristic).permit( { :property_ids => []}) if params[:characteristic]
    end
    def image_params
      params.require(:image).permit({:images => [:id, :image]})
    end
end
