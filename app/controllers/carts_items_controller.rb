
class CartsItemsController < ApplicationController
	before_action :set_cart_item, only: [:show, :edit, :update, :destroy]

# before_action :authenticate_user!, only: [:index, :edit]

  def index
  	@cart_items = CartItem.all
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
  	# 変更前 @cart_item = @cart.cart_items.build(item: item)


    @cart_item.save
    redirect_to cart_path(@cart)

  end

  def destroy
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

