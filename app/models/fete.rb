class Fete < ApplicationRecord
has_and_belongs_to_many :countries, :join_table => :fetehavecountries
translates :name
def name
j=read_attribute("name_"+I18n.locale.to_s)

if countries.length > 0
j << " "
j << countries.map{|x|I18n.t('linkwords.inplace', place: x.name)}.to_sentence
end
j

end
def self.festivaltoday
k=Date.today
where(date: (1900..k.year).map {|x|Date.new(x,k.month,k.day)})
end

end
