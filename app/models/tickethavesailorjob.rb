class Tickethavesailorjob < ApplicationRecord
belongs_to :ticket
belongs_to :sailorjob
validates_uniqueness_of :ticket_id, scope: :sailorjob_id
end
