class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :last_name_furi, :string
    add_column :users, :first_name, :string
    add_column :users, :first_name_furi, :string
    add_column :users, :profile_image_id, :text
    add_column :users, :delivery_address_id, :integer
    add_column :users, :zip, :string
    add_column :users, :address, :string
    add_column :users, :tel, :string
  end
end
