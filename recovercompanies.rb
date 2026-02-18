File.readlines('./mycompanies.csv').to_a.each do |g|
p g
Company.create!([:id, :name_fr,:name_en,:name_de, :image].zip(g.split('|')[0..4]).to_h)


end
