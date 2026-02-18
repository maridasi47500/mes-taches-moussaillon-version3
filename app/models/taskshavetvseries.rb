class Taskshavetvseries < ApplicationRecord
belongs_to :task
belongs_to :tvseries
validates_uniqueness_of :tvseries_id, scope: :task_id
end
