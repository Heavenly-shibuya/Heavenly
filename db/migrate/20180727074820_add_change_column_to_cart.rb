class AddChangeColumnToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :order_delivery, :text
  end
end
