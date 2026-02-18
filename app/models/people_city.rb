class PeopleCity < ApplicationRecord
def self.nbpages
(all.length / 10).to_i
end
def self.bypage(i)
all.limit(10).offset(i.to_i * 10)
end

belongs_to :person
belongs_to :city
validates_uniqueness_of :person_id, scope: :city_id
has_and_belongs_to_many :photos, :join_table => :peoplecitieshavephotos

attr_accessor :myphotos
before_validation :allmyphotos
def allmyphotos
if self.myphotos && self.myphotos.length > 0
self.myphotos.each do |g|
self.photos.new(name: g,title:[self.person.name,self.city.name].join(' à '))
end
end
end
end