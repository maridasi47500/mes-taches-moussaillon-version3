class Attitudephoto < ApplicationRecord
has_many :attitudephotohavetickets
has_many :tickets, through: :attitudephotohavetickets
accepts_nested_attributes_for :tickets, allow_destroy: true

attr_accessor :person1, :person2, :ageperson1, :ageperson2
translates :title
has_many :photopeoplehaveattitudes
has_many :photopeoplehavetraits
accepts_nested_attributes_for :photopeoplehaveattitudes
accepts_nested_attributes_for :photopeoplehavetraits
before_validation :setdates

def setdates
p1= Person.find(person1) rescue nil
p2= Person.find(person2) rescue nil
if p1 && p1.dateofbirth && ageperson1.to_i > 0
self.start_at = (p1.dateofbirth.to_datetime + ageperson1.to_i.years)

end
if p2 && p2.dateofbirth && ageperson2.to_i > 0
self.end_at = (p2.dateofbirth.to_datetime + ageperson2.to_i.years)

end
end
end
