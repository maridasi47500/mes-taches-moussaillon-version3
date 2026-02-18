json.extract! create_webpage, :id, :title, :url, :created_at, :updated_at
json.url create_webpage_url(create_webpage, format: :json)
