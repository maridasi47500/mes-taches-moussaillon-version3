class Linkspouseperson < ApplicationRecord
has_and_belongs_to_many :photos, :join_table => :linkspousepeoplehavephotos
attr_accessor :myphotos
belongs_to :twoperson
has_one :person, through: :twoperson, source: :person
has_one :otherperson, through: :twoperson, source: :otherperson, class_name: 'Person'

before_validation :allmyphotos
def allmyphotos
if self.myphotos
self.myphotos.each do |g|
self.photos.new(name: g,title:self.couplename)
end
end
end
def couplename
[self.twoperson.person.name, self.twoperson.otherperson.name].to_sentence
end

has_many :coupleevents
accepts_nested_attributes_for :coupleevents, allow_destroy: true
has_many :otherinterestingcouples
has_many :otherlinkspousepeople, through: :otherinterestingcouples, source: :otherlinkspouseperson

has_many :linkspousehavetickets
has_many :tickets, through: :linkspousehavetickets
after_initialize do
self.twoperson ||= Twoperson.new

end
has_many :loverrelations
def mysexes
[person,otherperson].map {|x| [I18n.t("pagesshow.person.#{x.mysexedisplayspec}")+" (#{x.name})",x.id]}
end
def loversnames
[person.name,otherperson.name].to_sentence

end
def name
person.name+" "+otherperson.name+" "+spouselink.name

end

def person_id
person ? person.id : nil
end
def otherperson_id
otherperson ? otherperson.id : nil
end
def relationship
self.person.name+" "+self.otherperson.name+" "+self.spouselink.name
end
def self.allpeopleincouple
Person.joins('left join twopeople t on t.person_id = people.id or t.otherperson_id = people.id').joins('left join linkspousepeople l on l.twoperson_id = t.id').joins('left join people other on other.id = t.otherperson_id or other.id = t.person_id').select('l.id,people.id as peopleid, people.name,other.id as otherid,other.name as othername').where('peopleid <> otherid and l.id is not null')
end


belongs_to :spouselink

accepts_nested_attributes_for :twoperson
accepts_nested_attributes_for :otherperson
validates_uniqueness_of :twoperson_id, scope: :spouselink_id
def self.findbyid(i)
joins('left join parentlinks links on links.id = linkspousepeople.spouselink_id').joins('left join twopeople tp on tp.id = linkspousepeople.twoperson_id').joins('left join people p1 on p1.id = tp.person_id').joins('left join people p2 on tp.otherperson_id = p2.id').select('tp.*,linkspousepeople.*, p1.*, p2.*, linkspousepeople.spouselink_id as linkid, linkspousepeople.id as id,links.id as linkid2, links.name_'+I18n.locale.to_s+' as linkname, p1.name as person1, p2.name as person2,linkspousepeople.id as worktwoid, (p1.name || \' \' || p2.name || \' \' || links.name_'+I18n.locale.to_s+') as name, linkspousepeople.id').where(id: i)
end
def self.findbyname(n)
if n.to_s.squish.strip.length >= 3
      str="%#{n.to_s.squish.strip.gsub(' ','%')}%"

joins('left join parentlinks links on links.id = linkspousepeople.spouselink_id').joins('left join twopeople tp on tp.id = linkspousepeople.twoperson_id').joins('left join people p1 on p1.id = tp.person_id').joins('left join people p2 on tp.otherperson_id = p2.id').select('tp.*,p1.*, p2.*, linkspousepeople.spouselink_id as linkid, linkspousepeople.id as id,links.id as linkid2, links.name_'+I18n.locale.to_s+' as linkname, p1.name as person1, p2.name as person2,linkspousepeople.id as worktwoid, (p1.name || \' \' || p2.name || \' \' || links.name_'+I18n.locale.to_s+') as name, linkspousepeople.*').where(['links.name_en like ? or links.name_fr like ? or links.name_de like ? or p1.name like ? or p2.name like ? or p2.firstnames like ? or p2.description like ? or p2.lastname like ? or p1.firstnames like ? or p1.lastname like ?']+Array.new(10,str))
else
[]
end
end

end
