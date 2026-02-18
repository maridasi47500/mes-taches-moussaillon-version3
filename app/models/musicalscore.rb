class Musicalscore < Thing
attr_accessor :seemyinstrument
attr_accessor :seethekeys
has_many :scoreshavekeys
has_many :musicalkeys, :through => :scoreshavekeys
has_many :bars
has_many :scorecriteria
#belongs_to :musicalinstrument, optional: true, foreign_key: ""
has_many :musicalscoreshavemusicalinstruments
has_many :musicalinstruments, through: :musicalscoreshavemusicalinstruments
accepts_nested_attributes_for :bars, allow_destroy: true
def self.findbyid(h)
where(id: h)
end

def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'
        where(["lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ?",o,o,o])
end
def self.navigscores(i)
all.limit(10).offset(i.to_i * 10) || []
end
def self.precedent(i)
all.limit(10).offset(i.to_i * 10).to_a.length > 0
end
def self.suivant(i)
all.limit(10).offset((i.to_i + 1)*10).to_a.length > 0
end
def self.allnavigscores
all.each_slice(10).to_a
end
end
