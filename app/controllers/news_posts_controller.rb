class NewsPostsController < ApplicationController
  def index
		@newsall = NewsPost.all
		# News_post.page(params[:page]).reverse_order
  end

  def show
		@news = NewsPost.find(params[:id])
  end
end
