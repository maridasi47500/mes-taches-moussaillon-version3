class Tasksailorusedstuffhaveperson < ApplicationRecord
belongs_to :tasksailorusedstuff
belongs_to :person
validates_uniqueness_of :tasksailorusedstuff_id, scope: :person_id
end
