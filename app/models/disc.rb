class Disc < ApplicationRecord

  belongs_to :item
  has_many :songs, inverse_of: :disc
  accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true



	# belongs_to :item
	# has_many :songs, dependent: :destroy
	# accepts_nested_attributes_for :songs, allow_destroy: true
end
