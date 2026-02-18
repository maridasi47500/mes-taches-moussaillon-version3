class Savedtasksailor < ApplicationRecord
belongs_to :person
belongs_to :task
belongs_to :user
validates_uniqueness_of :user_id, scope: [:person_id, :task_id]
end
