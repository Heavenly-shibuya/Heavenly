class AddTimeToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :time, :string
  end
end
