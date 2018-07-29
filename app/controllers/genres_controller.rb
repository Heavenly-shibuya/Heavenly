class GenresController < ApplicationController


  def index
  end

  def show
  	@genre = Item.where(genre_id: params[:para])
  end
end
