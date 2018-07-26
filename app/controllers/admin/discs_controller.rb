class Admin::DiscsController < ApplicationController
  before_action :correct_user
  before_action :authenticate_admin!

  private
    def correct_user
      if user_signed_in?
        redirect_to genres_path
      end
    end
end
