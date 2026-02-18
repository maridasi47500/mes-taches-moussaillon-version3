json.extract! historicalevent, :id, :name, :image, :created_at, :updated_at
json.url historicalevent_url(historicalevent, format: :json)
