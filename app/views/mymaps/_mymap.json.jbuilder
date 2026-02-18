json.extract! mymap, :id, :image, :width, :height, :created_at, :updated_at
json.url mymap_url(mymap, format: :json)
