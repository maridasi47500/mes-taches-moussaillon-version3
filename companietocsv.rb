require 'csv'
CSV.open("mycompanies.csv", "w") do |csv|
Company.all.pluck(:id, :name_fr,:name_en,:name_de, :image).each do |t|
  csv << t
  # ...
end
end

