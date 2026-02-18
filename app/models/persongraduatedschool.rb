class Persongraduatedschool < ApplicationRecord
belongs_to :schoolhperson
has_one :person, through: :schoolhperson
has_one :school, through: :schoolhperson
validates_presence_of :date
has_and_belongs_to_many :photos, join_table: :persongraduatedschoolshavephotos
has_and_belongs_to_many :trophies, join_table: :persongraduatedschoolshavetrophies
attr_accessor :mytitle,:myphotos
accepts_nested_attributes_for :photos, allow_destroy: true
before_validation :allmyphotos
def allmyphotos
if self.myphotos
self.myphotos.each do |g|
self.photos.new(name: g,title:"diplôme #{person.name} à #{school.name}")
end
end
end

end
