class Taskhasgithubrepo < ApplicationRecord
belongs_to :githubrepo
belongs_to :task
validates_uniqueness_of :githubrepo_id, scope: :task_id
end
