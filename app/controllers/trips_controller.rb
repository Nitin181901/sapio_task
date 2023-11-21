class TripsController < ApplicationController
  def index
    @trips = current_user.trips
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.trips.build(trip_params)
    @trip.user_id = params[:session_id]
    if @trip.save
      redirect_to trips_path, notice: 'Trip added successfully.'
    else
      render :new
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:name)
  end
end