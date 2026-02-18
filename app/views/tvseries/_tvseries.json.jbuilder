json.extract! tvseries, :id, :name, :image, :description, :created_at, :updated_at
json.url tvseries_url(tvseries, format: :json)
