class Invitehavetask < ApplicationRecord
belongs_to :task
belongs_to :invite
validates_uniqueness_of :task_id, scope: :invite_id
end
