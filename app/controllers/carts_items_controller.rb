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
  	@cart_item = @cart.cart_items.build(item: item)

  	respond_to do |format|
  		if @cart_item.save
  			format.html {redirect_to @cart_item.cart, notice: 'カートに商品が追加されました。'}
  			format.json {render :show, status:, :created, location: @cart_item }
  		else
  			format.html {render :new}
  			format.json {render json: @cart_item.errors, status: :unprocessable_entity}
  		end
  end

  def destroy
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_items_url, notice: 'cart item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    def set_line_item
      @cart_item = CartItem.find(params[:id])
    end

    def line_item_params
      params.require(:cart_item).permit(:item_id, :cart_id)
    end
end
