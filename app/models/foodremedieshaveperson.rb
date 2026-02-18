class Foodremedieshaveperson < ApplicationRecord
belongs_to :remedieshavefood
belongs_to :person
#validates_uniqueness_of :remedieshavefood_id, scope: :person_id
before_validation do
self.created_at=DateTime.now
end

end

