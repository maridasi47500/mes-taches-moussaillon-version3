class Attitudetvseries < ApplicationRecord
belongs_to :tvseries
belongs_to :attitude
belongs_to :person
belongs_to :user
validates_uniqueness_of :tvseries_id, scope: [:attitude_id,:user_id,:person_id]
end
