class Artist < ApplicationRecord
  attachment :top_image
  attachment :artist_image
  
  has_many :item
end
