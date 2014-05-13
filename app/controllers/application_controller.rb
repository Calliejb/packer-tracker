class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper

  helper_method :current_user

	def current_user
		# memoization ||=
		if session[:remember_token]
			@current_user ||=  User.find(session[:remember_token])
		else
			@current_user = nil
		end
	end
	def authenticate_user
		if !signed_in?
			redirect_to new_sessions_path
		end
	end

	def sign_in(user)
		session[:remember_token] = user.id
		@current_user = user
	end

	def sign_out
		session.delete(:remember_token)
		@current_user = nil
	end

end
