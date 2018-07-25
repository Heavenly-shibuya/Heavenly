class ArtistsController < ApplicationController

# before_action :authenticate_user!, only: [:index, :show, :update]

  def index
    @artist = Artist.all.page(params[:page])
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

