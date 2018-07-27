class AddColumn3ToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :delivery_address_id, :integer
  end
end
