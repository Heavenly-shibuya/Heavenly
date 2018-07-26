class CartItem < ApplicationRecord

	belongs_to :item
	belongs_to :cart
	belongs_to :order



	# 小計
	def total_price
		item.price * quantity
	end

end
