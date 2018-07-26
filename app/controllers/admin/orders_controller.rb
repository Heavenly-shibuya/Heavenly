class Admin::OrdersController < ApplicationController
  before_action :correct_user
  before_action :authenticate_admin!

  def index
  end

  def show
  end

  def new
  	# @cart = current_curt
  	# if @cart.cart_items.empty?
  	# 	redirect_to items_path
  	# 	return
  	# end

  	# @order = Order.new
  end

  def edit
  end

  def create
  	# @order = Order.new(order_params)
  	# @order.save
  end

  private
  def correct_user
    if user_signed_in?
       redirect_to genres_path
    end
  end

end
