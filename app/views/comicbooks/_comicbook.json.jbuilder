json.extract! comicbook, :id, :image, :title, :description, :created_at, :updated_at
json.url comicbook_url(comicbook, format: :json)
