class Item < ApplicationRecord
  has_many :discs, inverse_of: :item
  accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
  has_many :artists
  has_many :genres
end
