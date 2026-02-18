class Programminglanguage < Computingstuff
has_and_belongs_to_many :coders, :join_table => :programminglanguageshavecoders, class_name: 'Person'

def self.mycoders
joins('left join programminglanguageshavecoders m on m.programminglanguage_id = things.id').select('things.*,m.*,m.person_id as personid').where('personid is not null')
end
def self.nbpeople
(mycoders.group('personid').length / 10).to_i
end
def self.mycodersbypage(i)
mycoders.group('personid').limit(10).offset(i.to_i * 10)
end

def self.findbyid(h)
where(id: h)
end

def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'
        where(["lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ?",o,o,o])
end

  
end
