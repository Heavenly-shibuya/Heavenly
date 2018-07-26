class CartsController < ApplicationController
  def index
  end

  def show
  	@cart = current_cart
  end
end
