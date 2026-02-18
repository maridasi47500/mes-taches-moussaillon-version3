class Notetask < ApplicationRecord
belongs_to :task
belongs_to :user
validates_uniqueness_of :task_id, scope: :user_id
def myscore
case note
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
