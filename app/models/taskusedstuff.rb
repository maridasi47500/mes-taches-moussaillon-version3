class Taskusedstuff < ApplicationRecord
belongs_to :task
belongs_to :thing
belongs_to :user
validates_uniqueness_of :task_id, scope: [:thing_id,:user_id]
has_many :tasksailorusedstuffs
has_many :people, through: :tasksailorusedstuffs, source: :person

end
