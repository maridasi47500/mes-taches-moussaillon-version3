class Peopleknowcomputingstuff < ApplicationRecord
belongs_to :person
belongs_to :computingstuff
validates_uniqueness_of :person_id, scope: :computingstuff_id
end
