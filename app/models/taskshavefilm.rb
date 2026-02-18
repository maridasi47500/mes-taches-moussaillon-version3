class Taskshavefilm < ApplicationRecord
belongs_to :task
belongs_to :film
validates_uniqueness_of :task_id, scope: :film_id
end
