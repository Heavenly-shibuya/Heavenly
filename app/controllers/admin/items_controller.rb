class Admin::ItemsController < ApplicationController
  def show
    @item =Item.find(params[:id])
    @artist = @item.artists
    @genre = @item.genres
    # @cart = Cart.new


    @current_stock_array = []
    # @item.stock.times do |quantity|
    # if quantity < 10
    #   #quantityが10未満かどうか
    #   @current_stock_array << [quantity + 1, quantity + 1]
    #     #quantityは0からスタートしているので、1足した数を入れる
    #     #配列の左側がsubmitが押された時に渡される値、右側が表示される値
    #   else
    #     break
    #     #ループを抜ける
    #   end
    # end
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