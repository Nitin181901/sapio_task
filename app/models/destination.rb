class Destination < ApplicationRecord
  belongs_to :user

  validates :name, :address, presence: true

  before_save :geocode_address

  private

  def geocode_address
    result = Geocoder.search(address).first
    if result
      self.latitude = result.latitude
      self.longitude = result.longitude
    end
  end
end
