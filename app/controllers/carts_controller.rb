class CartsController < ApplicationController
  def index
  end

  def show
  	@cart = current_cart
  end

    def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    flash[:notice] = "Cart was successfully destroyed."
    redirect_to carts_path
    end
end
