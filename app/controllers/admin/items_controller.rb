class Admin::ItemsController < ApplicationController
  def show
  end

  def edit
  end

  def new
    @item = Item.new
    @disc = @item.discs.build
    @song = @disc.songs.build
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to  admin_item_path(@item.id)
  end

  def stock
  end

  def stock_edit
  end

private
  def item_params
      params.require(:item).permit(:title, :label, :genre_id, :artist_id, :price, :stock, :item_image,
                                     discs_attributes: [:id, :disc_name, :item_id, :_destroy,
                                     songs_attributes:[:id, :title, :track_order, :disc_id, :time, :_destroy]])
    end
end
