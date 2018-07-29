class RemoveOrderFuriFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :last_name_furi, :string
    remove_column :orders, :first_name_furi, :string
    remove_column :orders, :address, :string
  end
end
