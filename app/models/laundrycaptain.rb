class Laundrycaptain < ApplicationRecord
belongs_to :laundryjiramaperson, foreign_key: 'laundryjiramaperson_id'
belongs_to :laundryjiramaotherperson, foreign_key: 'laundryjiramasuperiorgradeperson_id', class_name: 'Laundryjiramaperson'
def self.kpten(u)
new(laundryjiramaperson:Laundryjiramaperson.new(grade: Armygrade.new(nom: "Grade"), alias: Alias.new(alias: Person.new(name: "Personne Soldat"),user: u)), laundryjiramaotherperson: Laundryjiramaperson.new(grade: Armygrade.new(nom: "Grade"), alias: Alias.new(alias: Person.new(name: "Personne Soldat"),user: u)))
end
end
