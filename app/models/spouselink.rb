class Spouselink < Parentlink
has_many :linkspousepeople
def self.findbyid(i)
where(id: i)
end
  def self.findbyname(n)
    if n.to_s.length > 0
    n1="%#{n.to_s.downcase.gsub(' ','%')}%"
    n1=I18n.transliterate(n1)
    where('lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ?',n1,n1,n1)
    else
    []
    end
  end

end
