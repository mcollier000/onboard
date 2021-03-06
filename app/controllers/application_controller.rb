class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	helper_method :require_user
	helper_method :current_user
	helper_method :current_user?
	def current_user
		if session[:user_id].present?
			User.find(session[:user_id])
		end
	end

	def current_user?
		current_user.present?
	end

	def require_user
		if current_user?
			current_user
		else
			flash[:error] = "You must be logged in to do that"
			redirect_to new_session_path
		end
	end

end
