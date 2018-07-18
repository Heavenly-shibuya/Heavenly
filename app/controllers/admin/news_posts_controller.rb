class Admin::NewsPostsController < ApplicationController
	def index
		@newsall = NewsPost.all
		# News_post.page(params[:page]).reverse_order
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

	def update
		@news = NewsPost.find(params[:id])
		if @news.update(news_post_params)
			flash[:notice] = "News was successfully updated."
			redirect_to admin_news_post_path(@news)
		else
			render 'edit'
		end
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
end