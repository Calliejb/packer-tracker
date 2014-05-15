class ProfilesController < ApplicationController
  
  
  def new
  	@profile = Profile.new
  end

  def create
  	@profile = Profile.new(params[:profile])
  	if @profile.save
  		flash[:notice] = "Your profile has been saved!"
  		redirect_to @profile
  	else
  		render :action => 'new'
  	end
  end

  def show
  	@profile = Profile.find(params[:id])
  end

  def edit
  end

  def update
  end

end
