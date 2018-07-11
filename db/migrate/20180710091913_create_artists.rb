class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :body
      t.text :top_image_id
      t.text :artist_image_id

      t.timestamps
    end
  end
end
