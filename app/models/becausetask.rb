class Becausetask < ApplicationRecord
belongs_to :task
belongs_to :othertask, class_name: 'Task'
end
