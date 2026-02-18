ActiveRecord::Base.connection.tables[2..-1].each do |name|
`rake db:seed:dump MODELS=#{name.titleize.gsub(' ','')} FILE=db/seeds/#{name}.rb`
end
