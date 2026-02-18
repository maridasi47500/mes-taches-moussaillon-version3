class Epochstudent < ApplicationRecord
belongs_to :epoch
belongs_to :person
belongs_to :grade
validates_uniqueness_of :person_id, scope: [:epoch_id,:grade_id]
end
