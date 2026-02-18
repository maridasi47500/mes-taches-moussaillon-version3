json.extract! fakearticle, :id, :title, :authorname, :authorpseudo, :content, :category, :pic, :authorpic, :created_at, :updated_at
json.url fakearticle_url(fakearticle, format: :json)
