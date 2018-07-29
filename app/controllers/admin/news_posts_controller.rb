class Admin::NewsPostsController < ApplicationController
	before_action :correct_user
	before_action :authenticate_admin!

	def index
		@newsall = NewsPost.page(params[:page]).per(5)
	end

	def show
		@news = NewsPost.find(params[:id])
	end

	def edit
		@news = NewsPost.find(params[:id])
	end

	def new
		@news = NewsPost.new
	end

	def create
		@news = NewsPost.new(news_post_params)
		@news.save
		flash[:notice] = "News was successfully created."
		redirect_to admin_news_post_path(@news)
	end

	def destroy
		news = NewsPost.find(params[:id])
		news.delete
		@newsall = NewsPost.all
		flash[:notice] = "News was successfully destroyed."
		redirect_to admin_news_posts_path
	end


	private

	def news_post_params
		params.require(:news_post).permit(:title, :body, :news_image)
	end

	def correct_user
		if user_signed_in?
			redirect_to genres_path
		end
	end
end
