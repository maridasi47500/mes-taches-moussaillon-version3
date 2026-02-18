class Drinkremedieshaveperson < ApplicationRecord
belongs_to :remedieshavedrink
belongs_to :person
#validates_uniqueness_of :remedieshavedrink_id, scope: :person_id
before_validation do
self.created_at=DateTime.now
end
end
