class AdminsController < ApplicationController
  def index
  end

  def show
  	@admin = Admin.find(params[:id])
    @user = User.all
  end

  def edit
  end
end
