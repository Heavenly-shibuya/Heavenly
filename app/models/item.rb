class Item < ApplicationRecord
  has_many :discs, inverse_of: :item
  accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
  belongs_to :artist
  has_many :genres
  has_many :discs
  has_many :songs, through: :discs
  has_many :reviews
  accepts_nested_attributes_for :reviews
  belongs_to :cart_item
  accepts_nested_attributes_for :cart_item
  enum genre_id:{jpop: 0,hiphop:1,レゲエ:2,RB:3, jazz:4,ロック:5,ELECTRONIC:6,KPOP:7,オルタナティブ:8}

    attachment :item_image


    def self.search(search)
    	if search !=''
    		@items = Item.where(['title LIKE ?', "%#{search}%"])
    	end
    end
end

