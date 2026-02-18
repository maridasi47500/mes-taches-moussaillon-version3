class Worktwo < ApplicationRecord
has_many :worktwoshavetickets
has_many :tickets, through: :worktwoshavetickets

after_initialize :myfunction

belongs_to :twoperson
def name
person.name+" "+otherperson.name
end
def person_id
person ? person.id : nil
end
def otherperson_id
otherperson ? otherperson.id : nil
end
has_one :person, through: :twoperson, source: :person
has_one :otherperson, through: :twoperson, source: :otherperson, class_name: 'Person'
  belongs_to :link, class_name: 'Peoplerelation', foreign_key: 'link_id'
accepts_nested_attributes_for :twoperson

def linkn
link ? link.name : ""
end
def self.findbyid(n)
where(id: n)
end
def self.findbynameorlink(n)
if n.to_s.squish.strip.length >= 3
      str="%#{n.to_s.squish.strip.gsub(' ','%')}%"

joins('left join peoplerelations links on links.id = worktwos.link_id').joins('left join twopeople tp on tp.id = worktwos.twoperson_id').joins('left join people p1 on p1.id = tp.person_id').joins('left join people p2 on tp.otherperson_id = p2.id').select('tp.*,worktwos.*, p1.*, p2.*, worktwos.link_id as linkid, worktwos.id as id,links.id as linkid2, links.name as linkname, p1.name as person1, p2.name as person2,worktwos.id as worktwoid').where(['links.name like ? or p1.name like ? or p2.name like ? or p2.firstnames like ? or p2.description like ? or p2.lastname like ? or p1.firstnames like ? or p1.lastname like ?']+Array.new(8,str))
else
[]
end
end
def myfunction
p self
p self.twoperson
self.twoperson ||= Twoperson.new

end

end
