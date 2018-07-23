class OrderItemsController < ApplicationController

# before_action :authenticate_user!, only: [:index, :show, :new]

  def index

    @items = Item.all.page(params[:page])
    # @order_items = OrderItems.where(item_id: @item.id)



  end

  def show
  end

  def new
  end
end
