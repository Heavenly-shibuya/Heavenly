class DeliveryAddressesController < ApplicationController
  def new
    @delivery_address = DeliveryAddress.new
  end

  def create
    delivery_address = DeliveryAddress.new(delivery_address_params)
    delivery_address.user_id = current_user.id
    delivery_address.save
    redirect_to delivery_addresses_path
  end

  def index
    @delivery_address = DeliveryAddress.where(user_id: current_user.id)
  end

  def edit
    @delivery_address = DeliveryAddress.find(params[:id])
  end

  def update
    delivery_address = DeliveryAddress.find(params[:id])
    delivery_address.update(delivery_address_params)
    redirect_to delivery_addresses_path
  end

  def destroy
    delivery_address = DeliveryAddress.find(params[:id])
    delivery_address.destroy
    redirect_to delivery_addresses_path
  end

private
    def delivery_address_params
      params.require(:delivery_address).permit(:last_name, :last_name_furi, :first_name, :first_name_furi, :zip, :address, :tel)
    end
end
