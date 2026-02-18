#class Task < ApplicationRecord
#  has_and_belongs_to_many :events #events_tasks
#  has_and_belongs_to_many :posts #posts_tasks
#  has_many :relatedtasks, class_name: 'Task', foreign_key: 'task_id'
#  belongs_to :maintask, class_name: 'Task', foreign_key: 'task_id'
#end
