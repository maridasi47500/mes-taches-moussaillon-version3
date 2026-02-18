class Optiontask < ApplicationRecord
belongs_to :task
belongs_to :followingtask, class_name: 'Task'
validates_uniqueness_of :task_id, scope: :followingtask_id
end
