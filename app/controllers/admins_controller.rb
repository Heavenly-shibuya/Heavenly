class AdminsController < ApplicationController
  def index
  	@user = User.all

  end

  def edit
  end
end
