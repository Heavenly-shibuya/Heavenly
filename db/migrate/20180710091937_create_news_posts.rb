class CreateNewsPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :news_posts do |t|
      t.text :title
      t.text :body
      t.text :news_image_id

      t.timestamps
    end
  end
end
