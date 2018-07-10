class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.string :price
      t.string :quantity
      t.integer :order_id
      t.integer :item_id

      t.timestamps
    end
  end
end
