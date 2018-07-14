class UsersController < ApplicationController

  def index

  end

  def show
      @user = User.find(params[:id])
      # @user = current_user
  end

  def edit
      @user = User.find(params[:id])
  end

    def update
  	@user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
end

def user_params
    params.require(:user).permit(:name,:email,:last_name,:last_name_furi,:first_name,:first_name_furi,:delivery_address_id,:zip,:address,:tel)
end


end
