class Admin::ArtistsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @artist = Artist.new
  end

  def create
    artist = Artist.new(artist_params)
    artist.save
    redirect_to edit_admin_artist_path(artist.id)
  end

private
    def artist_params
      params.require(:artist).permit(:top_image, :artist_image, :body, :name)
    end
end
