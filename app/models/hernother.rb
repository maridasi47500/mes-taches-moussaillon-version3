class Hernother < ApplicationRecord
belongs_to :person
belongs_to :otherperson, class_name: 'Person'
validates_uniqueness_of :person_id, scope: :otherperson_id
def personname
person.name+' ' +otherperson.name
end

def self.findbyid(i)
where(id: i)
end
def self.findbyname(n)
if n.to_s.squish.strip.length >= 3
      str="%#{n.to_s.squish.strip.gsub(' ','%')}%"

joins('left join people p2 on p2.id = hernothers.otherperson_id').joins('left join people p1 on p1.id = hernothers.person_id').where(["p1.name like ? or p2.name like ? or p2.firstnames like ? or p2.description like ? or p2.lastname like ? or p1.firstnames like ? or p1.lastname like ? or (p1.name || ' ' || p1.firstnames || ' ' || p1.lastname || ' ' || p2.name || p2.firstnames || p2.lastname) like ? or (p2.name || ' ' || p2.firstnames || ' ' || p2.lastname || ' ' || p1.name || p1.firstnames || p1.lastname) like ?"]+Array.new(9,str)).select("p1.name as person1, p2.name as person2,hernothers.id")
end
end

end
