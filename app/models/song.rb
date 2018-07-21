class Song < ApplicationRecord

	belongs_to :disc
	delegate :item, to: :disc
end
