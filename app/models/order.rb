class Order < ApplicationRecord
	has_many :cart_items, dependent: :destroy
	belongs_to :user, optional: true
	has_many :delivery_addresses

	# validates :last_name, presence: true, length: { maximum: 10 }
	# validates :first_name, presence: true, length: { maximum: 10 }
	# ３桁の数字 + ハイフン + ４桁の数字
	# validates :zip, presence: true
	# , format: { with: /\A\d{3}\-?d{4}\z/ }
	# validates :order_delivery, presence: true
	# validates :tel, presence: true

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
