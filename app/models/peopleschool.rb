class Peopleschool < ApplicationRecord
belongs_to :person
belongs_to :school
belongs_to :user
validates_uniqueness_of :school_id, scope: [:person_id, :user_id]
end
