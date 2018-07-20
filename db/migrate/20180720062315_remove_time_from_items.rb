class RemoveTimeFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :time, :string
  end
end
