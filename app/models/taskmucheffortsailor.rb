class Taskmucheffortsailor < ApplicationRecord
belongs_to :person
belongs_to :task
belongs_to :taskaction
belongs_to :user
validates_uniqueness_of :person_id, scope: [:task_id, :taskaction_id, :user_id]
end
