class Admin::OrdersController < ApplicationController

  before_action :correct_user
  before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page]).per(10)
    @user = current_admin
  end

  def edit
    @order = Order.find(params[:id])
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:notice] = "Order was successfully destroyed."
    redirect_to admin_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:payment, :last_name, :first_name, :zip, :address, :tel, :user_id, :status, :order_delivery )
  end

  def correct_user
    if user_signed_in?
     redirect_to genres_path
   end
 end

end