class Olympicpeoplehaveevent < ApplicationRecord
belongs_to :event
belongs_to :olympicperson

validates_uniqueness_of :event_id, scope: :olympicperson_id
end
