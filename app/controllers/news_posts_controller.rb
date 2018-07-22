class NewsPostsController < ApplicationController

	def index
		# @newsall = NewsPost.all
		@newsall = NewsPost.all.page(params[:page])
	end

	def show
		@news = NewsPost.find(params[:id])
	end

	def update
		@news = NewsPost.find(params[:id])
		@news.update(news_post_params)
		redirect_to edit_admin_news_post_path(@news)
	end

	private

	def news_post_params
		params.require(:news_post).permit(:title, :body, :news_image)
	end
end