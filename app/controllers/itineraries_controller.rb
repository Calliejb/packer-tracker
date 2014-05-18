class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user
  # GET /itineraries
  # GET /itineraries.json
  
  def index
    @itineraries = Itinerary.where(:country => params[:country])
  end


  def show
    @itinerary = Itinerary.find(params[:id])
  end

  # GET /itineraries/new
  def new
    @itinerary = Itinerary.new
  end

  def edit
  end

  def create
    Itinerary.create(itinerary_params)
    redirect_to itineraries_path
  end


  def update

    @itinerary = Itinerary.find(params[:id])
    if @itinerary.update(itinerary_params)
      redirect_to itineraries_path
    else
      render 'edit'
    end

  end

  # DELETE /itineraries/1
  # DELETE /itineraries/1.json
  def destroy
    @itinerary.destroy
    respond_to do |format|
      format.html { redirect_to itineraries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinerary
      @itinerary = Itinerary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itinerary_params
      params.require(:itinerary).permit(:name, :country, :date_start, :date_end)
    end
end
