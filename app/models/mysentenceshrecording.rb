class Mysentenceshrecording < ApplicationRecord
belongs_to :mysentence
belongs_to :recording
validates_uniqueness_of :mysentence_id, scope: :recording_id
end
