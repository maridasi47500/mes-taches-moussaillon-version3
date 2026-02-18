require 'nokogiri'
require 'open-uri'
#@web=Nokogiri::HTML(URI.open("https://www.iban.com/country-codes"))
#@web.css('table')[0].css('tr')[1..].map{|row|row.css('td').map(&:text)}.each{|name,nb2,nb3,nb|Country.where("lower(name_en) like ?","%"+name.downcase+"%").first_or_create(name_en: name).update(code: nb3)}
@web=Nokogiri::HTML(URI.open("https://en.wikipedia.org/wiki/List_of_IOC_country_codes"))
def getcountries(nbtable)
@web.css('table')[nbtable].css('tr')[1..].map{|row|row.css('td').map(&:text)}.each do |nb3,name,codes,link|
if nb3.strip.squish.length == 3
Country.where("lower(name_en) like ?","%"+name.strip.squish.downcase+"%").first_or_create(name_en: name.strip.squish).update(code: nb3)
end
end
end
getcountries(0)
getcountries(1)
getcountries(2)
