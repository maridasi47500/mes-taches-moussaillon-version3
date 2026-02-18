class Risktask < ApplicationRecord
belongs_to :person
belongs_to :task
belongs_to :user
validates_uniqueness_of :person_id, scope: [:task_id, :user_id]
end
