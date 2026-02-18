class Taskhaveepoch <  ApplicationRecord
belongs_to :task
belongs_to :epoch
validates_uniqueness_of :task_id, scope: :epoch_id
end
