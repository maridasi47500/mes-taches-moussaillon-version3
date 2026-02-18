class School < Thing
has_many :schoolhpeople
has_many :beautifulschools
has_many :peoplenotebeautifulschools, through: :beautifulschools
has_many :people, through: :schoolhpeople
has_and_belongs_to_many :photos, :join_table => :schoolhavephotos

attr_accessor :myphotos
before_validation :allmyphotos
def mynotes(u)
beautifulschools.where(user: u)
end
def allmyphotos
if self.myphotos
self.myphotos.each do |g|
self.photos.new(name: g,title:self.name)
end
end
end
  def self.findbyname(n)
    if n.to_s.length > 0
    o="%#{n.to_s.downcase.gsub(' ','%')}%"
    #n1=I18n.transliterate(n1)
        where(["lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ?",o,o,o])

    else
    []
    end
  end

        def self.findbyid(o)
                where("id"=>o)
        end

end
