json.extract! transac, :id, :somme, :date, :motif, :username, :created_at, :updated_at
json.url transac_url(transac, format: :json)
