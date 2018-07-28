class Order < ApplicationRecord
	has_many :cart_items, dependent: :destroy
	belongs_to :user, optional: true
	has_many :delivery_addresses

	def add_items(cart)
		cart.cart_items.each do |item|
			item.cart_id = nil
			cart_items << item
		end
	end

	def totals_price
		cart_items.to_a.sum{ |item| item.total_price}
	end
end
