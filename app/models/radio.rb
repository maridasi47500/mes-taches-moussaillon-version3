class Radio < ApplicationRecord
translates :motto
has_many :radioshavecities
has_many :cities, through: :radioshavecities
has_many :radioshavejingles
has_many :jingles, through: :radioshavejingles
alias_attribute :name, :radioname
  def self.findbyname(n)
    if n.to_s.length > 0
    n1="%#{n.to_s.downcase.gsub(' ','%')}%"
    #n1=I18n.transliterate(n1)
    joins(:cities).select('cities.*, radios.*').where(['lower(cities.name_de) like ? or lower(cities.name_fr) like ? or lower(cities.name_en) like ? or lower(radios.motto_en) like ? or lower(radios.motto_fr) like ? or lower(radios.motto_de) like ? or lower(radios.frequency) like ? or radios.radioname like ?']+Array.new(8,n1))
    else
    []
    end
  end
  def self.findbyid(i)
    where(id: i)
  end

end
