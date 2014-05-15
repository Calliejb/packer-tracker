class ItineraryListsController < ApplicationController

  def index
    @itinerarylists = ItineraryList.all
  end

  def show
  	@itinerarylist = ItineraryList.find(params[:id])
    @itineraries = Itinerary.all
  end

  def new
    @itinerarylist = ItineraryList.new
    @itineraries = Itinerary.all
    3.times { @itinerarylist.itineraries.build }
  end

  def create
  	@itinerarylist = ItineraryList.new(params[:itinerarylist])
  	@itineraries = 
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
    if @itinerarylist.update(params.require(:itinerarylist).permit(:name, :itinerary_ids => []))
      redirect_to burritos_path
    else
      render 'edit'
    end
  end

  def destroy
  end


end