class RemoveDeliveryDeliFromTitles < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :delivery_address_id, :integer
  end
end
