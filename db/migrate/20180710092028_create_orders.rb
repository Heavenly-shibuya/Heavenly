class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.text :payment
      t.string :last_name
      t.string :last_name_furi
      t.string :first_name
      t.string :first_name_furi
      t.string :zip
      t.string :address
      t.string :tel

      t.timestamps
    end
  end
end
