class Selfiehavesailor < ApplicationRecord
belongs_to :selfie
belongs_to :person
belongs_to :emotion
validates_uniqueness_of :selfie_id, scope:[:person_id,:emotion_id]
end
