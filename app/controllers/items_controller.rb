class ItemsController < ApplicationController
  def show
  end

  def update
  	@item =Item.find(params[:id])
  	@item.update(item_params)
  	redirect_to admin_item_path(@item.id)
  end

  private

  def item_params
    params.require(:item).permit(:title, :label, :genre_id, :artist_id, :price, :stock, :item_image,
     discs_attributes: [:id, :disc_name, :item_id, :_destroy,
       songs_attributes:[:id, :title, :track_order, :disc_id, :time, :_destroy]])
  end

end
