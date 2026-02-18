class Sailorhaveattitudesintask < ApplicationRecord
belongs_to :person
belongs_to :task
belongs_to :attitude
belongs_to :user
validates_uniqueness_of :user_id, scope: [:person_id, :task_id, :attitude_id, :user_id]
def myscore
case score
when 1
"mauvaise"
when 2
"moyenne"
when 3
"bonne"
when 4
"tres bonne"
when 5
"excellente"
end
end
end
