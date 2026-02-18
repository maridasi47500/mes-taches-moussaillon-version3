class Liketask < ApplicationRecord
self.table_name = 'liketask'
belongs_to :user
belongs_to :task
validates_uniqueness_of :user_id, scope: :task_id
after_validation :like
def like
Dontliketask.where(user: self.user, task: self.task).destroy_all
end

end
