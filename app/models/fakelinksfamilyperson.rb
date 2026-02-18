class Fakelinksfamilyperson < ApplicationRecord

belongs_to :user

after_initialize do

self.twoperson ||= Twoperson.new

end
def inverseorder
g=twoperson.otherperson
f=twoperson.person
s=Twoperson.find_or_create_by(person: g, otherperson: f)
p s
i=Twoperson.find_or_create_by(person: f, otherperson: g)
p i
if s.person != self.person
self.twoperson = s 
else
self.twoperson = i
end

save
end
def soeurs
self.familylink.name_de =="Geschwister" && self.twoperson.allwomen

end
def self.twopersonlink
  joins("left join twopeople t on t.id = fakelinksfamilypeople.twoperson_id")
end

def freres

self.familylink.name_de =="Geschwister" && self.twoperson.allmen

end

def name
person.name+" "+otherperson.name+" "+familylink.name
end


def person_id
person ? person.id : nil
end
def otherperson_id
otherperson ? otherperson.id : nil
end
def self.findbyid(n)
joins('left join parentlinks links on links.id = fakelinksfamilypeople.familylink_id').joins('left join twopeople tp on tp.id = fakelinksfamilypeople.twoperson_id').joins('left join people p1 on p1.id = tp.person_id').joins('left join people p2 on tp.otherperson_id = p2.id').select('tp.*,fakelinksfamilypeople.*, p1.*, p2.*, fakelinksfamilypeople.familylink_id as linkid, fakelinksfamilypeople.id as id,links.id as linkid2, links.name_'+I18n.locale.to_s+' as linkname, p1.name as person1, p2.name as person2,fakelinksfamilypeople.id as worktwoid, (p1.name || \' \' || p2.name || \' \' || links.name_'+I18n.locale.to_s+') as name_'+I18n.locale.to_s).where(id: n)
end
def relationship
self.person.name+" "+self.otherperson.name+" "+self.familylink.name
end
def self.findbyname(n)
if n.to_s.squish.strip.length >= 3
      str="%#{n.to_s.squish.strip.gsub(' ','%')}%"

joins('left join parentlinks links on links.id = fakelinksfamilypeople.familylink_id').joins('left join twopeople tp on tp.id = fakelinksfamilypeople.twoperson_id').joins('left join people p1 on p1.id = tp.person_id').joins('left join people p2 on tp.otherperson_id = p2.id').select('tp.*,fakelinksfamilypeople.*, p1.*, p2.*, fakelinksfamilypeople.familylink_id as linkid, fakelinksfamilypeople.id as id,links.id as linkid2, links.name_'+I18n.locale.to_s+' as linkname, p1.name as person1, p2.name as person2,fakelinksfamilypeople.id as worktwoid, (p1.name || \' \' || p2.name || \' \' || links.name_'+I18n.locale.to_s+') as name').where(['links.name_en like ? or links.name_fr like ? or links.name_de like ? or p1.name like ? or p2.name like ? or p2.firstnames like ? or p2.description like ? or p2.lastname like ? or p1.firstnames like ? or p1.lastname like ?']+Array.new(10,str))
else
[]
end
end



belongs_to :familylink

belongs_to :twoperson, autosave: true
has_one :person, through: :twoperson, source: :person
has_one :otherperson, through: :twoperson, source: :otherperson, class_name: 'Person'
accepts_nested_attributes_for :otherperson, allow_destroy: true
accepts_nested_attributes_for :person, allow_destroy: true
accepts_nested_attributes_for :twoperson, allow_destroy: true


validates_uniqueness_of :twoperson_id, scope: :familylink_id


end
