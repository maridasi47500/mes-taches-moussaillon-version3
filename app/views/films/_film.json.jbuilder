json.extract! film, :id, :title, :description, :image, :created_at, :updated_at
json.url film_url(film, format: :json)
