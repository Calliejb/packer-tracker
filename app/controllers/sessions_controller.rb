class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.where(:email => params[:session][:email]).first

		puts "a;oj;oaijdo;s jcij;ol++++++++++++++++"
		puts @user.username

		if @user && @user.authenticate(params[:session][:password])
			session[:remember_token] = @user.id
			@current_user = @user
			redirect_to root_path
		else
			flash[:error] = "Invalid email/password combination"
			render 'new'

		end
	end

  def destroy
    session.delete(:remember_token)
    redirect_to new_sessions_path
    # redirect to sign in page
  end

end