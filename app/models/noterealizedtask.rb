class Noterealizedtask < ApplicationRecord
belongs_to :task
belongs_to :user
validates_uniqueness_of :task_id, scope: :user_id
def myscore
case note
when 1
"mal"
when 2
"pas tres bien"
when 3
"bien"
when 4
"tres bien"
when 5
"super bien"
end
end

end
