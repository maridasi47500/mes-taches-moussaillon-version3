class Surnamehaveperson < ApplicationRecord
belongs_to :surname
belongs_to :person
validates_uniqueness_of :surname_id, scope: :person_id
end
