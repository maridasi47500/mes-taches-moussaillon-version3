class Beautifulperson < ApplicationRecord
belongs_to :user
belongs_to :person
validates_presence_of :note
validates_uniqueness_of :user_id, scope: :person_id

def notemeaning
case note
when 1
"#{person.name} est moche"
when 2
"#{person.name} est un peu moche"
when 3
"#{person.name} est pas belle"
when 4
"#{person.name} est pas très belle"
when 5
"#{person.name}, bof "
when 6
"#{person.name} est pas canon, mais est pas laid"
when 7
"#{person.name}, je l'ai vu(e) il/elle est très musclé(e) très bronzé(e)"
when 8
"#{person.name} est un beau jeune homme/une belle jeune fille"
when 9
"#{person.name} est très très très beau/belle"
when 10
"#{person.name} est magnifique ou beau/belle gosse"
end
end
end