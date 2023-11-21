class DestinationsController < ApplicationController
  def index
    @destinations = current_user.destinations
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = current_user.destinations.build(destination_params)
    @destination.user_id = params[:session_id]
    if @destination.save
      redirect_to destinations_path, notice: 'Destination added successfully.'
    else
      render :new
    end
  end

  def fetch_tripadvisor_data
    return if tripadvisor_id.present?

    api_key = 'e117dfca22c8c84f6c888aad9cec2a44'
    query = "#{name} #{address}" # You might need to adjust the query based on your data

    response = HTTParty.get("https://api.tripadvisor.com/api/partner/2.0/location_search/#{URI.encode(query)}?key=#{api_key}")

    if response.code == 200
      data = JSON.parse(response.body)
      self.tripadvisor_id = data['data'].first['result_object']['location_id'] if data['data'].present?
    end
  end

  private

  def destination_params
    params.require(:destination).permit(:name, :address)
  end
end