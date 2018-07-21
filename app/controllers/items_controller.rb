class ItemsController < ApplicationController
  def show
  end

  def search
  	@items = Item.page(params[:page]).reverse_order.search(params[:search])
  	@artists = Artist.page(params[:page]).reverse_order.search(params[:search])
  	@songs = Song.page(params[:page]).reverse_order.search(params[:search])
  end


end
