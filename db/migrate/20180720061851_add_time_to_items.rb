class AddTimeToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :time, :string
  end
end
