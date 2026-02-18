class City < ApplicationRecord
has_many :citynews
has_many :someonemusicalinstruments
has_many :musicalinstrumentshaveplayers,through: :someonemusicalinstruments
has_and_belongs_to_many :photos, :join_table => :citieshavephotos
translates :name
has_many :sectorshavecities
has_many :sectors, through: :sectorshavecities
belongs_to :state, optional: true
belongs_to :country, optional: true
belongs_to :nationality, optional: true
before_validation :allmyphotos
attr_accessor :myphotos
def allmyphotos
if self.myphotos
self.myphotos.each do |g|
self.photos.new(name: g,title:self.name)
end
end
end
def fullname
[name, state.try(:name), country.try(:name)].select{|y|y}.join(', ')
end
def semifullname
[name, state.try(:name)].select{|y|y}.join(', ')

end

def self.withsector
joins(:sectors).distinct
end

  def self.findbyname(n)
    if n.to_s.length > 0
    n1="%#{n.to_s.downcase.gsub(' ','%')}%"
    #n1=I18n.transliterate(n1)
    where(['lower(name_fr) like ? or lower(name_en) like ? or lower(name_de) like ? or lower(name_it) like ?']+Array.new(4,n1))
    else
    []
    end
  end
  def self.findbyid(i)
    where(id: i)
  end


end
