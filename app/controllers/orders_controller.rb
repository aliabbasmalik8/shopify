class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_shop

  # GET /orders
  # GET /orders.json
  def index
    @orders = @shop.orders
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @orders =Order.find(params[:id]).products.with_deleted
  end

  # GET /orders/new
  def new
    @order = @shop.orders.build
  end

  # GET /orders/1/edit
  def edit
    @order=@shop.orders.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = @shop.orders.create(:shop_id => params[:shop_id],:user_id => current_user.id)

    # Order.order_product_table_update(current_user.id)

    OrderProduct.order_product_table_update(current_user.id,@order.id)

    respond_to do |format|
      if @order.save
        format.html { redirect_to shop_orders_url(@order.shop_id), notice: 'Order was successfully created.'}
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @oredr=@shop.orders.find(params[:id])
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to shop_orders_url(@order.shop_id), notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order=@shop.orders.find(params[:id])
    @order.really_destroy!
    respond_to do |format|
      format.html { redirect_to shop_orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:status).merge(:user_id => current_user.id)
    end

    def set_shop
      @shop = Shop.find(params[:shop_id])
    end

end
