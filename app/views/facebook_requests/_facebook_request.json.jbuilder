json.extract! facebook_request, :id, :name, :created_at, :updated_at
json.url facebook_request_url(facebook_request, format: :json)
