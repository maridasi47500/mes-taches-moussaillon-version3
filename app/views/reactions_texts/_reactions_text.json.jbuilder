json.extract! reactions_text, :id, :name, :created_at, :updated_at
json.url reactions_text_url(reactions_text, format: :json)
