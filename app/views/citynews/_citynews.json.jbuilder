json.extract! citynews, :id, :created_at, :updated_at
json.url citynews_url(citynews, format: :json)
