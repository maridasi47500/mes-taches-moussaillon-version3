class Ticketsaboutperson < ApplicationRecord
belongs_to :ticket
belongs_to :aboutperson, class_name: 'Person', foreign_key: 'person_id'
end
