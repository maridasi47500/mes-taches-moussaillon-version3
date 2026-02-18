json.extract! githubrepo, :id, :reponame, :githubrepo_id, :created_at, :updated_at
json.url githubrepo_url(githubrepo, format: :json)
