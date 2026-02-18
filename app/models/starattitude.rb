class Starattitude < ApplicationRecord
belongs_to :task
belongs_to :user
belongs_to :winningattitude
validates_uniqueness_of :task_id, scope: [:user_id, :winningattitude_id]
end
