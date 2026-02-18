class Twoperson < ApplicationRecord


has_many :twopeoplehavecities
has_many :cities, through: :twopeoplehavecities
has_many :twopeoplehavecompanies
has_many :companies, through: :twopeoplehavecompanies
has_many :betterpeople
has_many :linkspousepeople
has_many :linkfamilypeople
has_many :linkfamilypeoplebis, source: :otherperson, class_name: "Linkfamilyperson"
has_many :twopeoplehavejobs
has_many :jobs, through: :twopeoplehavejobs
has_many :olympicpeople
belongs_to :person
belongs_to :otherperson, class_name: 'Person'
#validates_uniqueness_of :person_id, scope: :otherperson_id
#validate :uniqueness_of_name
def allmen
Twoperson.where(id: self.id).joins('left join people p1 on p1.id = twopeople.person_id').joins('left join people p2 on p2.id = twopeople.otherperson_id').select('twopeople.*, p1.*, p2.*').where(['p1.sexe = ? and p2.sexe = ?','M','M']).length > 0
end
def allwomen
Twoperson.where(id: self.id).joins('left join people p1 on p1.id = twopeople.person_id').joins('left join people p2 on p2.id = twopeople.otherperson_id').select('twopeople.*, p1.*, p2.*').where(['p1.sexe = ? and p2.sexe = ?','F','F']).length > 0
end
def self.similar(i,j)
where(['(person_id = ? and otherperson_id = ?) or (otherperson_id = ? and person_id = ?)',i,j,i,j])
end
def uniqueness_of_name
    existing_record = Person.findbyid(person_id)
    second_existing_record = Person.findbyid(otherperson_id)
    similar_records=Twoperson.similar(person_id,otherperson_id)
    unless (existing_record && second_existing_record && similar_records.length == 0) || (linkspousepeople.length == 0 || betterpeople.length == 0 || linkfamilypeople.length == 0)
        errors.add(:base, "Vouliez-vous dire ces deux ?")
    end
end

accepts_nested_attributes_for :person
accepts_nested_attributes_for :otherperson
#after_initialize :orderid
def self.findbyid(i)
where(id: i)
end
def self.findbyname(n)
if n.to_s.squish.strip.length >= 3
      str="%#{n.to_s.squish.strip.gsub(' ','%')}%"

joins('left join people p2 on p2.id = twopeople.otherperson_id').joins('left join people p1 on p1.id = twopeople.person_id').where(["p1.name like ? or p2.name like ? or p2.firstnames like ? or p2.description like ? or p2.lastname like ? or p1.firstnames like ? or p1.lastname like ? or (p1.name || ' ' || p1.firstnames || ' ' || p1.lastname || ' ' || p2.name || p2.firstnames || p2.lastname) like ? or (p2.name || ' ' || p2.firstnames || ' ' || p2.lastname || ' ' || p1.name || p1.firstnames || p1.lastname) like ?"]+Array.new(9,str)).select("p1.name as person1, p2.name as person2,twopeople.id twopersonid")
end
end
def idnul
!(self.person_id && self.otherperson_id)
end
def alreadyexist
if self.new_record?
Twoperson.find_by(person: person, otherperson: otherperson)
else
nil
end

end

def orderid
if self.person_id && self.otherperson_id && self.person_id < self.otherperson_id

i=self.person_id
j=self.otherperson_id
self.person_id=j
self.otherperson_id=i
end
rescue ActiveModel::MissingAttributeError
end

end
