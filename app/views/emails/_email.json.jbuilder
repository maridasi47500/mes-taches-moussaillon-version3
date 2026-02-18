json.extract! email, :id, :from, :to, :content, :subject, :created_at, :updated_at
json.url email_url(email, format: :json)
