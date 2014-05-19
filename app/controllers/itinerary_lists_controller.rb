class ItineraryListsController < ApplicationController

  def index
    @itinerarylists = ItineraryList.all
  end

  def show
  	@itinerarylist = ItineraryList.find(params[:id])
  end

  def new
    @itinerarylist = ItineraryList.new
    3.times do
      @itinerarylist.itineraries.build
    end
      
  end


  def create
    # raise params.inspect
  	@itinerarylist = ItineraryList.new(params.require(:itinerary_list).permit(:name, itineraries_attributes: [:country, :date_start, :date_end]))
    @itinerarylist.user = current_user
    if @itinerarylist.save
  		flash[:notice] = "Created a new Itinerary!"
  		redirect_to @itinerarylist
  	else
  		render :action => 'new'
  	end
  end

  def edit
    @itinerarylist = ItineraryList.find(params[:id])
  end

  def update
    @itinerarylist = ItineraryList.find(params[:id])
    if @itinerarylist.update(params.require(:itinerary_list).permit(:name, itineraries_attributes: [:country, :date_start, :date_end]))
      redirect_to itinerary_list_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @itinerarylist = ItineraryList.find(params[:id])
    if @itinerarylist.present?
      @itinerarylist.destroy
    end
    redirect_to user_path(current_user)
  end



end