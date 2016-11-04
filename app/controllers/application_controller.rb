class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :set_locale
	before_action :pundit_user
	before_filter :configure_permitted_parameters, if: :devise_controller?
	
	include Pundit

	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	def set_locale
		I18n.locale = :tr || I18n.default_locale
	end

	protected
		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :title])
			devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :current_password, :title, :description, :itunes, :stitcher, :podbay, :thumbnail])
		end

	private
		def user_not_authorized
			flash[:alert] = "Bu alanda değişiklik yapma yetkiniz yoktur!"
			redirect_to(request.referrer || root_path)
		end

		def pundit_user
			current_podcast
		end
end
