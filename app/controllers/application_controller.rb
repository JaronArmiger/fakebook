class ApplicationController < ActionController::Base
	# info about storing location and redirecting
	# after sign in:
	# https://github.com/heartcombo/devise/wiki/How-To:-Redirect-back-to-current-page-after-sign-in,-sign-out,-sign-up,-update

	include ApplicationHelper
	before_action :store_user_location!, if: :storable_location?
	#before_action :require_log_in, except: [:new, :create]
	#before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?

	private

	  def configure_permitted_parameters
	  	update_attrs = [:name, :password, :password_confirmation, :current_password, :profile_picture]
	  	devise_parameter_sanitizer.permit(:sign_up, keys: update_attrs)
	  	devise_parameter_sanitizer.permit(:account_update, keys: update_attrs)
	  end

	  def storable_location?
	  	request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
	  end

	  def store_user_location!
	  	store_location_for(:user, request.fullpath)
	  end

	  def after_sign_in_path_for(resource_or_scope)
		stored_location_for(resource_or_scope) || super
	  end
end
