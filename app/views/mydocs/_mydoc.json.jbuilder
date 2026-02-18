json.extract! mydoc, :id, :controller, :action, :content, :user_id, :created_at, :updated_at
json.url mydoc_url(mydoc, format: :json)
