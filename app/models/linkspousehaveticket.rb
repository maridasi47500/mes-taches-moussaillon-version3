class Linkspousehaveticket < ApplicationRecord
belongs_to :linkspouseperson
belongs_to :ticket
validates_uniqueness_of :ticket_id, scope: [:linkspouseperson_id]
end
