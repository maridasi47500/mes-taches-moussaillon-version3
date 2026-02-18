json.extract! twitteraccount, :id, :name, :username, :created_at, :updated_at
json.url twitteraccount_url(twitteraccount, format: :json)
