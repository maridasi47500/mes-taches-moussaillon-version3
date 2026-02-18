json.extract! restaurant, :id, :name, :image, :city_id, :place_id, :state_id, :description, :country_id, :longitude, :latitude, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
