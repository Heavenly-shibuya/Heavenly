class Admin::OrdersController < ApplicationController

  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :correct_user
  before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:payment, :last_name, :last_name_furi, :first_name, :first_name_furi, :zip, :address, :tel, :user_id )
  end
end
  private
  def correct_user
    if user_signed_in?
       redirect_to genres_path
    end
  end

end