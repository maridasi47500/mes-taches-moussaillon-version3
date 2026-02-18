json.extract! event, :id, :end_at, :start_at, :longitude, :latitude, :city_id, :place_id, :state_id, :address, :name, :created_at, :updated_at
json.url event_url(event, format: :json)
