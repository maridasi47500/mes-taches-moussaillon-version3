class Dontliketask < ApplicationRecord
self.table_name = 'dontliketask'
belongs_to :user
belongs_to :task
validates_uniqueness_of :user_id, scope: :task_id
after_validation :like
def like
Liketask.where(user: self.user, task: self.task).destroy_all
end
end

