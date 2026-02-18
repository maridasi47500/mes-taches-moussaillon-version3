class Personarmycompagny < ApplicationRecord
belongs_to :person
belongs_to :armycompagny
validates_uniqueness_of :person_id, scope: :armycompagny_id
def self.findbyid(i)
where(person_id: i).joins(:person,:armycompagny).select("personarmycompagnies.*,people.name as personname,armycompagnies.name as compagniename")
end

end
