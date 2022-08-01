class ItinerariesController < ApplicationController
  def index
    #@itineraries = Itinerary.where(:user_id => current_user.id)
    itineraries = Itinerary.all
    render json: itineraries
  end
  
  def new
    #@itinerary = current_user.itineraries.build 
    @itinerary = Itinerary.new #delete this line and switch to the above line once relationships and models are built properly
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    if @itinerary.valid? 
      @itinerary.save
      redirect_to @itinerary
    else
      render "new"
    end
  end

  def show
    itinerary = Itinerary.find(params[:id])
    if itinerary
      render json: itinerary.slice(:id, :name, :start_date, :end_date)
    else
      render json: { message: "Itinerary not found." }
    end
  end

  def edit
    @itinerary = Itinerary.find(params[:id])
  end

  def update
    @itinerary = Itinerary.find(params[:id])
    if @itinerary.update!(itinerary_params)
      redirect_to @itinerary
    else
      render "edit"
    end
  end

  def destroy
    Itinerary.find(params[:id]).destroy
    redirect_to itineraries_path
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:name, :start_date, :end_date, :user_id)
  end

end
