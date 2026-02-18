class Worktwoshaveticket < ApplicationRecord
belongs_to :worktwo
belongs_to :ticket
validates_uniqueness_of :ticket_id, scope: :worktwo_id
end
