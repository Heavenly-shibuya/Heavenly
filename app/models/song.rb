class Song < ApplicationRecord

	belongs_to :disc


      def self.search(search)
    	if search !=''
    		@songs = Song.where(['title LIKE ?', "%#{search}%"])
    	end
    end

	delegate :item, to: :disc

end
