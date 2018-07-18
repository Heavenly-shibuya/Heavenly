class ArtistsController < ApplicationController
  def index
  end

  def show
    @artist = Artist.find(params[:id])
    @items = Item.where(artist_id: @artist.id)

  end

  def update
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    redirect_to edit_admin_artist_path(artist.id)
  end

private
    def artist_params
      params.require(:artist).permit(:top_image, :artist_image, :body, :name)
    end
end
