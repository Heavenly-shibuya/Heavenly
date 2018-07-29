class Admin::UsersController < ApplicationController
  before_action :correct_user
  before_action :authenticate_admin!
  def index
  end

  def show
     # @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to edit_admin_user_path(@user.id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.soft_delete
    sign_out(@user)
    redirect_to admins_index_path
    flash[:notice] = '強制退会させました'
  end

  private
  def correct_user
    if user_signed_in?
      redirect_to genres_path
    end
  end

  def user_params
      params.require(:user).permit(:name,:email,:last_name,:last_name_furi,:first_name,:first_name_furi,:delivery_address_id,:zip,:address,:tel,:profile_image)
  end

end

