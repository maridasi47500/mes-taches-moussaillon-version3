json.extract! bodypart, :id, :name_en, :name_fr, :name_de, :created_at, :updated_at
json.url bodypart_url(bodypart, format: :json)
