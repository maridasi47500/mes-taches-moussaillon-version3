class Alias < ApplicationRecord
  belongs_to :alias, class_name: 'Person', foreign_key: "person_id"
  belongs_to :user
  validates_uniqueness_of :person_id, scope: :user_id
has_many :mybookings
def myuniquename
"#{self.alias.name} (#{user.name})"
end
def self.findbyid(h)
where(id: h)
end
def self.createwithiduser(personid,user)
y=find_or_create_by(person_id: personid,user: user)
where(id: y.id)
end
def self.findbyidbis(personid,user)
y=find_or_create_by(person_id: personid,user: user)
where(id: y.id)
end
def self.findorcreatefrompersoniduser(personid,user)
y=find_or_create_by(person_id: personid,user: user)
where(id: y.id)
end
end
