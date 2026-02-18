json.extract! tweet, :id, :content, :username, :created_at, :lieu, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
