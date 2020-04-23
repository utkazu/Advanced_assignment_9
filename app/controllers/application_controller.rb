class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	def configure_permitted_parameters
		added_attrs = [:name, :email, :postal_code, :address, :password, :password_confirmation, :remember_me, :prefecture_code, :address_city, :address_street, :address_building]
		devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
		devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
	end

end
