class Schoolhperson < ApplicationRecord

belongs_to :person
belongs_to :school
validates_uniqueness_of :person_id, scope: :school_id
has_many :persongraduatedschools
def mydates
if persongraduatedschools.length > 0
person.name+' a eu le(s) diplôme '.pluralize(persongraduatedschools.length)+persongraduatedschools.map {|x| I18n.l(x.date,format: :long)}.to_sentence
end
end
end
