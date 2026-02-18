class Remedieshavefood < ApplicationRecord
belongs_to :food
belongs_to :personstate
has_many :foodremedieshavepeople
has_many :people, through: :foodremedieshavepeople

validates_uniqueness_of :food_id, scope: :personstate_id
def self.findby(drinkid,person)
find_by(food_id: drinkid, personstate_id: person)
end
end

