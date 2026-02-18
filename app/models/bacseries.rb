class Bacseries < ApplicationRecord
has_many :sectorshavebacseries
has_many :sectors, through: :sectorshavebacseries
def self.withsector
joins('left join sectorshavebacseries j on j.bacseries_id = bacseries.id').joins('left join sectors s on s.id = j.sector_id').select('j.*, s.*, bacseries.*').distinct
end

  def self.findbyname(n)
    if n.to_s.length > 0
    n1="%#{n.to_s.downcase.gsub(' ','%')}%"
    #n1=I18n.transliterate(n1)
    where(['lower(name) like ?']+Array.new(1,n1))
    else
    []
    end
  end
  def self.findbyid(i)
    where(id: i)
  end

end
