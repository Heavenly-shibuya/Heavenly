class Artist < ApplicationRecord
  attachment :top_image
  attachment :artist_image
  # attachment :item_image
  has_many :items

      def self.search(search)
    	if search !=''
    		@artists = Artist.where(['name LIKE ?', "%#{search}%"])
    	end
    end
end
