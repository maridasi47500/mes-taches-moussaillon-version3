class Peoplebeliever < ApplicationRecord
belongs_to :user
belongs_to :person
validates_uniqueness_of :person_id, scope: :person_id
end
