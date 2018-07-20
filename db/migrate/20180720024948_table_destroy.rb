class TableDestroy < ActiveRecord::Migration[5.2]
  def change
    drop_table :derivery_addresses
  end
end
