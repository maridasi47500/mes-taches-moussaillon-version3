class Musicalinstrument < Artobject
has_and_belongs_to_many :players, :join_table => :musicalinstrumentshaveplayers, class_name: 'Person'
translates :name
has_many :barshavemusicalinstruments
has_many :bars, through: :barshavemusicalinstruments
def self.nbpages
(all.length/10).to_i
end
def self.bypage(i)
all.limit(10).offset(i.to_i)
end
def self.myplayers
joins('left join musicalinstrumentshaveplayers m on m.musicalinstrument_id = things.id').select('things.*,m.*,m.person_id as personid').where('personid is not null')
end
def self.nbpeople
(myplayers.group_by{|x|Person.find(x.personid)}.length/10).to_i
end
def self.myplayersbypage(i)
myplayers.group('personid').limit(10).offset(i.to_i)
end


def self.findbyid(n)
where("id" => n)
end
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'
      
        where(["lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ?",o,o,o])
end

end
