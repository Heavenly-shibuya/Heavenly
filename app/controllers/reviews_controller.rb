class ReviewsController < ApplicationController
  def index
  end

  def show
  	@item =Item.find(params[:id])
    @review = Review.new
  end

  def new
  end

  def create
  	item = Item.find(params[:item_id])
  	review = current_user.reviews.new(review_params)
  	review.item_id = item.id
  	review.save
  	redirect_to item_path(item.id)
  end

  private
	def review_params
	  params.require(:review).permit(:user_id, :item_id, :body)
	end
end



