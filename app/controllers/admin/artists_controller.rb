class Admin::ArtistsController < ApplicationController
  def index
    @artist = Artist.all.page(params[:page])
  end

  def show
    @artist = Artist.find(params[:id])
    @artist = Artist.find(params[:id])
    @items = Item.where(artist_id: @artist.id)
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    artist = Artist.new(artist_params)
    artist.save
    redirect_to edit_admin_artist_path(artist.id)
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    redirect_to admin_artists_path
  end

private
    def artist_params
      params.require(:artist).permit(:top_image, :artist_image, :body, :name)
    end
end
