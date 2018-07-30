class GenresController < ApplicationController


  def index
  end

  def show

  	@items = Item.where(genre_id: params[:id])
  	@item = Item.genre_ids.keys[params[:id].to_i]


  end
end
