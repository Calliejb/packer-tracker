class UsersController < ApplicationController
	def new
		@user = User.new
	end
	
	def show
    	@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to PackerTracker!"
			redirect_to :root
		else
			render :new
		end
	end

	def edit
	end


	protected

	def user_params
		params.require(:user).permit(:username, :email, :password, :name, :hometown, :about, itinerary_lists_attributes: [:name, :itinerary])
	end
end

