class Order < ApplicationRecord
	has_many :cart_items, dependent: :destroy
  belongs_to :cart

	def add_items(cart)
		cart.cart_items.each do |item|
			item.cart_id nil
			cart_items << item
		end
	end
end
