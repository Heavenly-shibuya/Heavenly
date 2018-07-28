class OrdersController < ApplicationController

  before_action :authenticate_user!
	before_action :set_order, only: [:show, :edit, :update]


	def index
		# @orders = Order.page(params[:page]).reverse.order.per(10)
		@user = current_user
		@orders = Order.where(user_id: @user.id)
	end

	def edit
	end

	def update
		@order.update(order_params)
		flash[:notice] = "OrderStatus was successfully Updated."
		redirect_to @order
	end

	def show
	end

	def new
		@cart = current_cart

		if @cart.cart_items.empty?
			flash[:notice] = "Cart is empty"
			redirect_to items_path
			return
		end

		@order = Order.new
		@user = current_user

		@derively = DeliveryAddress.where(user_id: @user.id)

	end

	def create
		@order = Order.new(order_params)
		@order.user_id = current_user.id
		@order.add_items(current_cart)

		if @order.save
			Cart.destroy(session[:cart_id])
			session[:cart_id] = nil
			redirect_to orders_path

		end
	end

	def destroy
		@order.destroy
		flash[:notice] = "Order was successfully destroyed."
		redirect_to orders_path
	end

	private

	def set_order
		@order = Order.find(params[:id])
	end

	def order_params
		params.require(:order).permit(:payment, :last_name, :last_name_furi, :first_name, :first_name_furi, :zip, :address, :tel, :user_id, :status, :order_delivery )
	end
end