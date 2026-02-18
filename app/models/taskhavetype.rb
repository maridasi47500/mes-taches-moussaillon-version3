class Taskhavetype < ApplicationRecord
belongs_to :task
belongs_to :tasktype
validates_uniqueness_of :tasktype_id, scope: :task_id
end
