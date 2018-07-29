# frozen_string_literal: true

class Admins::ConfirmationsController < Devise::ConfirmationsController
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
  private
  def correct_user
    if user_signed_in?
      redirect_to genres_path
    end
  end
end
