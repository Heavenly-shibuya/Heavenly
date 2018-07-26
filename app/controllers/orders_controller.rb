class OrdersController < ApplicationController
	def index
	end

	def show
	end

	def new
		@cart = current_cart
		if @cart.cart_items.empty?
			flash[:notice] = "Cart is empty"
			redirect_to orders_path
			return
		end

		@order = Order.new

	end

end

def create
	@order = Order.new(order_params)
	@order.add_items(current_curt)
	if @order.save
		Cart.destroy(session[:cart_id])
		session[:cart_id] = nil
      # 購入確定ページにする
      redirect_to items_path
  end

  def edit
  end

  def create
  	@order = Order.new(order_params)
  	@order.save
  end

  private

  def set_order
  	@order = Order.find(params[:id])
  end

  def order_params
  	params.require(:order).permit(:payment, :last_name, :last_name_furi, :first_name, :first_name_furi, :zip, :address, :tel )
  end
end
