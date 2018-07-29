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
    redirect_to admin_user_path(@user.id)
  end

  def destroy
    # @user = current_user
    # @user.soft_delete
    # sign_out(@user)
    # redirect_to new_user_registration_path
    # flash[:notice] = '退会が完了しました。'
  end

  private
  def correct_user
    if user_signed_in?
      redirect_to genres_path
    end
  end

end

