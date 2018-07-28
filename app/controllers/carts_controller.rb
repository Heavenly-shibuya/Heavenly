class CartsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def show
  	@cart = current_cart
  end

  private
end
