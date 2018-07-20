class Item < ApplicationRecord
  has_many :discs, inverse_of: :item
  accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
  has_many :artists
  enum genre_id:{jpop: 0,hiphop:1,レゲエ:2,RB:3, jazz:4,ロック:5,ELECTRONIC:6,KPOP:7,オルタナティブ:8}
    attachment :item_image
end
