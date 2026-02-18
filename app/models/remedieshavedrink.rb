class Remedieshavedrink < ApplicationRecord
has_many :drinkremedieshavepeople
has_many :people, through: :drinkremedieshavepeople
belongs_to :drink
belongs_to :personstate
validates_uniqueness_of :drink_id, scope: :personstate_id
def self.findby(drinkid,person)
find_by(drink_id: drinkid, personstate_id: person)
end

end
