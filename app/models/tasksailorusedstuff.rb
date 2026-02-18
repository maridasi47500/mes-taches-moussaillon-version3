class Tasksailorusedstuff < ApplicationRecord
belongs_to :taskusedstuff
belongs_to :person
validates_uniqueness_of :person_id, scope: :taskusedstuff_id
has_many :tasksailorusedstuffhavepeople
has_many :people, through: :tasksailorusedstuffhavepeople
end
