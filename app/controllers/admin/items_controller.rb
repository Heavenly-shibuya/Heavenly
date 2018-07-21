class Admin::ItemsController < ApplicationController
  def show
    @item =Item.find(params[:id])
    @artist = @item.artist
    @disc = @item.discs
    # @song = @item.songs
    # @cart = Cart.new
    @current_stock_array = []
    @item.stock.times do |stock|
    if stock < 10
      #quantityが10未満かどうか
      @current_stock_array << [stock + 1, stock + 1]
        #quantityは0からスタートしているので、1足した数を入れる
        #配列の左側がsubmitが押された時に渡される値、右側が表示される値
      else
        break
        #ループを抜ける
      end
    end
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
