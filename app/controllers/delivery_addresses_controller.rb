class DeliveryAddressesController < ApplicationController
  def new
    @delivery_address = DeliveryAddress.new
  end

  def create
    delivery_address = DeliveryAddress.new(delivery_address_params)
    delivery_address.save
    # redirect_to edit_admin_artist_path(artist.id)
  end

  def index
    @delivery_address = DeliveryAddress.find([:id])
  end

  def edit
  end

  def destroy
  end

private
    def delivery_address_params
      params.require(:delivery_address).permit(:last_name, :last_name_furi, :first_name, :first_name_furi, :zip, :address, :tel)
    end
end
