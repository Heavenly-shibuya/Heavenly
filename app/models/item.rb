class Item < ApplicationRecord

  has_many :discs, inverse_of: :item
  accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
  belongs_to :artist
  has_many :genres
  has_many :discs
  has_many :songs, through: :discs
  has_many :cart_items
  before_destroy :referenced_by_cart_item
  enum genre_id:{jpop: 0,hiphop:1,レゲエ:2,RB:3, jazz:4,ロック:5,ELECTRONIC:6,KPOP:7,オルタナティブ:8}

    attachment :item_image


    def self.search(search)
    	if search !=''
    		@items = Item.where(['title LIKE ?', "%#{search}%"])
    	end
    end

    def self.select_shop
	where("date <= ?","now()").order(title: "ASC")
   end

    private
    def referenced_by_cart_item
    	if cart_item.empty?
    		return true
    	else
    		errors.add(:base, '品目が存在します。')
    		retuen false
    	end
    end
end

