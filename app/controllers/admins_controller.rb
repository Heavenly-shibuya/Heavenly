class AdminsController < ApplicationController
  before_action :correct_user
  before_action :authenticate_admin!

  def index
  	@user = User.all

  end

  def edit
  end

  private
  def correct_user
    if user_signed_in?
       redirect_to genres_path
    end
  end
end
