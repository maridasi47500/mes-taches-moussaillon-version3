class Olympicperson < ApplicationRecord
belongs_to :user
has_many :olympicpeoplehaveevents
has_many :events, through: :olympicpeoplehaveevents
has_many :findthebests

after_initialize do

self.twoperson ||= Twoperson.new

end
def self.byid(i)
joins('left join twopeople t on t.id = olympicpeople.twoperson_id').joins('left join people p2 on p2.id = t.otherperson_id').joins('left join people p1 on p1.id = t.person_id').where(["(t.person_id in (#{Array.new(i.length,'?').join(',')}) or t.otherperson_id = (#{Array.new(i.length,'?').join(',')}))"]+i+i).select('olympicpeople.*, t.*,p1.*,p2.*,p1.id as p1,p2.id as p2,findthebests.winner as winner')

end
def name
person.name+" "+otherperson.name+" "+skill.name
end


def person_id
person ? person.id : nil
end
def otherperson_id
otherperson ? otherperson.id : nil
end
def self.findbyid(n)
joins('left join skills links on links.id = olympicpeople.skill_id').joins('left join twopeople tp on tp.id = olympicpeople.twoperson_id').joins('left join people p1 on p1.id = tp.person_id').joins('left join people p2 on tp.otherperson_id = p2.id').select('tp.*,olympicpeople.*, p1.*, p2.*, olympicpeople.skill_id as linkid, olympicpeople.id as id,links.id as linkid2, links.name_'+I18n.locale.to_s+' as linkname, p1.name as person1, p2.name as person2,olympicpeople.id as worktwoid, (p1.name || \' \' || p2.name || \' \' || links.name_'+I18n.locale.to_s+') as name').where(id: n)
end
def relationship
self.person.name+" "+self.otherperson.name+" "+self.skill.name
end
def self.findbyname(n)
if n.to_s.squish.strip.length >= 3
      str="%#{n.to_s.squish.strip.gsub(' ','%')}%"

joins('left join skills links on links.id = olympicpeople.skill_id').joins('left join twopeople tp on tp.id = olympicpeople.twoperson_id').joins('left join people p1 on p1.id = tp.person_id').joins('left join people p2 on tp.otherperson_id = p2.id').select('tp.*,olympicpeople.*, p1.*, p2.*, olympicpeople.skill_id as linkid, olympicpeople.id as id,links.id as linkid2, links.name_'+I18n.locale.to_s+' as linkname, p1.name as person1, p2.name as person2,olympicpeople.id as worktwoid, (p1.name || \' \' || p2.name || \' \' || links.name_'+I18n.locale.to_s+') as name').where(['links.name_en like ? or links.name_fr like ? or links.name_de like ? or p1.name like ? or p2.name like ? or p2.firstnames like ? or p2.description like ? or p2.lastname like ? or p1.firstnames like ? or p1.lastname like ?']+Array.new(10,str))
else
[]
end
end
belongs_to :skill
belongs_to :twoperson, autosave: true
has_one :person, through: :twoperson, source: :person
has_one :otherperson, through: :twoperson, source: :otherperson, class_name: 'Person'
accepts_nested_attributes_for :twoperson, allow_destroy: true
#validates_uniqueness_of :twoperson_id, scope: :skill_id


end
