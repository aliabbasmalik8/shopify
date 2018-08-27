class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_shop

  # GET /products
  # GET /products.json
  def index
    @products = @shop.products
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @products = @shop.products.find(params[:id])
  end

  # GET /products/new
  def new
    @product = @shop.products.build
    respond_to do |format|
      format.html 
    end
  end

  # GET /products/1/edit
  def edit
    @product=@shop.products.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product=@shop.products.create(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to shop_products_url(@product.shop_id), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: shop_url(@product.shop_id) }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product=@shop.products.find(params[:id])
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to shop_products_url(@product.shop_id), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: shop_url(@product.shop_id) }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product=@shop.products.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to shop_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def addProductId
    Product.addProduct(current_user.id,params[:product_id])
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def customer_view
    @products = @shop.products
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :purchasing_price, :image, :catagory, :belongs_to, :Shop)
    end

    def set_shop
      @shop=Shop.find(params[:shop_id])
    end
end
