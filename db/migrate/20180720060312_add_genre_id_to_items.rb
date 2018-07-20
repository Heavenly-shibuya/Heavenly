class AddGenreIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :genre_id, :integer, default: 0, null: false, limit: 1
  end
end
