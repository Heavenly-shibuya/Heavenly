class Cart < ApplicationRecord
	has_many :cart_items, dependent: :destroy
	has_many :orders

	# 追記部分
	def add_item(item_id, quantity)

		current_item = cart_items.find_by_item_id(item_id)

		if current_item

			current_item.quantity += quantity.to_i
		else
			current_item = cart_items.build(item_id: item_id, quantity: quantity.to_i)
		end
		current_item

	end

	# 合計
	def total_price
		cart_items.to_a.sum{ |item| item.total_price}
	end
end
