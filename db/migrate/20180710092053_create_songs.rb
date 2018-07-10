class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :track_order
      t.integer :disc_id

      t.timestamps
    end
  end
end
