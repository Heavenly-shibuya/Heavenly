class ReviewsController < ApplicationController
	def index
	end

	def show
	end

	def new
	end

	def create
		@item = Item.find(params[:id])
		@review = Review.new(review_params)
		@review.item_id = @item.id
		@review.user_id = current_user.id
		@review.save
		redirect_to new_item_path
	end

	private

	def review_params
		params.require(:review).permit(:item_id,:user_id, :body)
	end
end
