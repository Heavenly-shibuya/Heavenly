class Artist < ApplicationRecord
  attachment :top_image
  attachment :artist_image
  
  belongs_to :item
end
