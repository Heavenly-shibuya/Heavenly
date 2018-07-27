class CartItem < ApplicationRecord

	belongs_to :item
	belongs_to :cart
	belongs_to :order, optional: true



	# 小計
	def total_price
		item.price * quantity
	end

end
