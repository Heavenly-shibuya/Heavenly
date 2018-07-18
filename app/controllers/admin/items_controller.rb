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
  end

  def stock
  end

  def stock_edit
  end

  def item_params
      params.require(:item).permit(:title,
                                     discs_attributes: [:id, :disc_name, :item_id, :_destroy,
                                     songs_attributes:[:id, :title, :track_order, :disc_id, :_destroy]])
    end
end
