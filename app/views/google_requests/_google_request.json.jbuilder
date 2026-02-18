json.extract! google_request, :id, :name, :created_at, :updated_at
json.url google_request_url(google_request, format: :json)
