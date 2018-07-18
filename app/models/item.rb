class Item < ApplicationRecord


	has_many :discs, inverse_of: :item
	accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true

	# has_many :discs, dependent: :destroy
	# accepts_nested_attributes_for :discs, allow_destroy: true

  has_many :artists

end
