class PlaceList < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    timestamps
  end
  
  belongs_to :city
  belongs_to :category
  has_many  :places
  
  def self.place_search(category, city)
    key ="key=AIzaSyD6Stot3qM2qBRf3aZT7a30y70fsmKXCUw"
    parameters = key
    parameters += "&location="+city.lat+","+city.long
    parameters += "&radius=500"
    parameters += "&sensor=false"
    parameters += '&type=convenience_store'
    query = "https://maps.googleapis.com/maps/api/place/search/json?"+parameters
    response = JSON.parse(RestClient.get(query))
    number_of_responses = response["results"].size
    first_match = response["results"].first
  end
  
  def place_profile()
    key ="key=AIzaSyD6Stot3qM2qBRf3aZT7a30y70fsmKXCUw"
    parameters = key
    parameters += "&location="+city.lat+","+city.long
    parameters += "&radius=500"
    parameters += "&sensor=false"
    parameters += '&type=convenience_store'
    query = "https://maps.googleapis.com/maps/api/place/search/json?"+parameters
    response = JSON.parse(RestClient.get(query))
    number_of_responses = response["results"].size
    first_match = response["results"].first

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
