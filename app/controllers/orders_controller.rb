class OrdersController < ApplicationController

	before_action :authenticate_user!, only: [:index, :show, :new, :create, :buy]

	def index
		@user = current_user
		@orders = Order.page(params[:page]).where(user_id: @user.id).reverse_order
	end

	def update
		@order = Order.find(params[:id])
		@order.update(order_params)
		flash[:notice] = "OrderStatus was successfully Updated."
		redirect_to admin_order_path(@order)
	end

	def buy
	end

	def show
		@order = Order.find(params[:id])
	end

	def new
		@cart = current_cart

		if @cart.cart_items.empty?
			flash[:notice] = "Cart is empty"
			redirect_to genres_path
			return
		end

		@order = Order.new
		@user = current_user

		@delivery = DeliveryAddress.where(user_id: @user.id)

	end

	def create
		@order = Order.new(order_params)
		@order.user_id = current_user.id
		@order.add_items(current_cart)

		if @order.save
			Cart.destroy(session[:cart_id])
			session[:cart_id] = nil
			redirect_to buy_order_path

		end
	end

	private

	def order_params
		params.require(:order).permit(:payment, :last_name, :first_name, :zip, :tel, :user_id, :status, :order_delivery )
	end
end