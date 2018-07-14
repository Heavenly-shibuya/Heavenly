class AdminsController < ApplicationController
  def index
  end

  def show
  	@admin = Admin.find(params[:id])
  end

  def edit
  end
end
