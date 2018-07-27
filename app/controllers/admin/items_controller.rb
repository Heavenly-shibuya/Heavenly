class Admin::ItemsController < ApplicationController
  def show
    @item =Item.find(params[:id])
    @artist = @item.artist
    @discs = @item.discs
    @songs = @item.songs
  end

  def edit
    @item =Item.find(params[:id])
  end

  def destroy
    item =Item.find(params[:id])
    item.delete
    # 後で変更の必要あり？
    redirect_to new_admin_item_path
  end

  def new
    @item = Item.new
    @disc = @item.discs.build
    @song = @disc.songs.build
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def index
    @item = Item.all
    @item = Item.all.page(params[:page])
  end

  def stock_edit
  end

  private

  def item_params
    params.require(:item).permit(:title, :label, :genre_id, :artist_id, :price, :stock, :item_image,
     discs_attributes: [:id, :disc_name, :item_id, :_destroy, songs_attributes:[:id, :title, :track_order, :disc_id, :time, :_destroy]])
  end
end
