class Peoplecar < ApplicationRecord
belongs_to :person
belongs_to :car
belongs_to :user
validates_uniqueness_of :person_id, scope: [:car_id,:user_id]
has_and_belongs_to_many :photos, :join_table => :peoplecarhavephotos
attr_accessor :myphotos
before_validation :allmyphotos
def allmyphotos
if self.myphotos
self.myphotos.each do |g|
self.photos.new(name: g,title:[self.car.name,self.person.name].join(' avec une '))
end
end
end
def myname
car.name
end
def myimage
photos.first ? photos.first.myimagename : car.image
end
def mycar
person.name+" a une "+car.name
end
end
