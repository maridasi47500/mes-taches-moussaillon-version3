class Attitudephotohaveticket < ApplicationRecord
belongs_to :attitudephoto
belongs_to :ticket
validates_uniqueness_of :attitudephoto_id, scope: :ticket_id
end
