class ItemsController < ApplicationController
  def show
    @item =Item.find(params[:id])
    @artist = @item.artist
    @discs = @item.discs

    # @current_stock_array = []
    # @item.stock.times do |stock|
    # if stock < 10
    #   @current_stock_array << [stock + 1, stock + 1]
    #   else
    #     break
    #   end
    # end
  end

  def update
  	@item =Item.find(params[:id])
  	@item.update(item_params)
  	redirect_to admin_item_path(@item.id)
  end

  def search
    @items = Item.page(params[:page]).reverse_order.search(params[:search])
    @artists = Artist.page(params[:page]).reverse_order.search(params[:search])
    @songs = Song.page(params[:page]).reverse_order.search(params[:search])
  end

  private

  def item_params
    params.require(:item).permit(:title, :label, :genre_id, :artist_id, :price, :stock, :item_image,
     discs_attributes: [:id, :disc_name, :item_id, :_destroy,
       songs_attributes:[:id, :title, :track_order, :disc_id, :time, :_destroy]])
  end

  def review_params
    params.require(:review).permit(:item_id,:user_id, :body)
  end
end
