mkdir db/seeds
chown mary db/seeds -R 
chown mary db/seeds/* -R
rails c

#name = 'person' && `rake db:seed:dump MODELS=#{name.titleize.gsub(' ','')} FILE=db/seeds/#{name}.rb`
