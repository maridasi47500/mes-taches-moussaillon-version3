class Linkfamilyhaveticket < ApplicationRecord
belongs_to :ticket
belongs_to :linkfamilyperson
validates_uniqueness_of :linkfamilyperson_id, scope: :ticket_id
end
