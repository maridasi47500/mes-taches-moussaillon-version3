class Musicalkey < ApplicationRecord
has_many :barshavekeys
has_many :bars, :through => :barshavekeys
translates :name
translates :code
has_many :scoreshavekeys
has_many :musicalscores, :through => :scoreshavekeys
  def self.findbyid(n)
    Person.where('id' => n)
  end
  def self.findbyname(n)
    if n.to_s.length > 0
    n2="%#{n.to_s.gsub(' ','%')}%"
    n1="%#{n.to_s.downcase.gsub(' ','%')}%"
    #n1=I18n.transliterate(n1)
    where(['name_fr like ? or name_en like ? or name_de like ? or lower(name_fr) like ? or lower(name_en) like ? or lower(name_de) like ? or lower(code_de) like ? or lower(code_en) like ? or lower(code_fr) like ?']+Array.new(3,n2)+Array.new(6,n1))
    else
    []
    end
  end


end
