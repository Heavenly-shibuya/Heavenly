class AddUserIdToImages < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :profile_image_id, :text, default: 0
  end
end
