class CartsItemsController < ApplicationController
  before_action :authenticate_user!
	before_action :set_cart_item, only: [:show, :edit, :update, :destroy]

# before_action :authenticate_user!, only: [:index, :edit]

  def index
  end

  def show
  	  	@cart_items = CartItem.all
  end

  def edit
  end

  def new
  	@cart_item = CartItem.new
  end

  def update
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.html { redirect_to @cart_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
  	@cart = current_cart
  	item = Item.find(params[:item_id])
    @cart_item = @cart.add_item(item.id, params[:quantity])
    if item.stock.to_i - params[:quantity].to_i < 0
    	redirect_to item_path(item.id)
    	flash[:notice] = '在庫数の上限を超えています。'
    else
  	@cart_item_stock = params[:quantity]
  	item.stock -= @cart_item_stock.to_i
    @cart_item.save
    item.save
    redirect_to cart_path(@cart)
  end

  end

  def destroy
  	item = Item.find(params[:item_id])
    @cart_item = CartItem.find_by(cart_id:current_cart, item_id: item.id)
    @cart_item.item.stock += @cart_item.quantity.to_i
    @cart_item.item.save
    @cart_item.destroy
    redirect_to cart_url(@cart_item.cart_id)
    flash[:notice] = 'cart item was successfully destroyed.'
  end


  private
  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :cart_id)
  end
end

