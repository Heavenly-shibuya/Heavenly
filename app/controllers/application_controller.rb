class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
    if current_admin
      admin_genres_path
    else
      genres_path
    end
  end # ログイン後に遷移するpathを設定

  def after_sign_out_path_for(resource)
		if current_admin
      new_adimin_session_path
    else
      new_user_session_path
    end
	end


	def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email,:last_name,:last_name_furi,:first_name,:first_name_furi,:delivery_address_id,:zip,:address,:tel])
	# devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
	# devise_parameter_sanitizer.permit(:account_update, keys: [:name])
	end
end



