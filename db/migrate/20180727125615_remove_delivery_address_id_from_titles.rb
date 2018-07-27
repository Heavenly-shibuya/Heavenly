class RemoveDeliveryAddressIdFromTitles < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :delivery_address_id, :integer
  end
end
