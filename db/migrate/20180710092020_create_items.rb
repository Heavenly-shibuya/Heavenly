class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :stock
      t.integer :price
      t.string :label
      t.integer :genre_id

      t.timestamps
    end
  end
end
