class Admin::FavoritesController < ApplicationController
  before_action :correct_user
  before_action :authenticate_admin!

  def index
  end

  private
    def artist_params
      params.require(:artist).permit(:top_image, :artist_image, :body, :name)
    end

    def correct_user
      if user_signed_in?
        redirect_to genres_path
      end
    end
end
