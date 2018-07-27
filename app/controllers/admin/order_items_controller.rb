class Admin::OrderItemsController < ApplicationController
  before_action :correct_user
  before_action :authenticate_admin!

  def index
  end

  def stock
  end
  # def show
  # end

  def new
  end

  private
  def correct_user
    if user_signed_in?
       redirect_to genres_path
    end
  end
end
