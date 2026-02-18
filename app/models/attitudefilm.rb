class Attitudefilm < ApplicationRecord
belongs_to :film
belongs_to :attitude
belongs_to :person
belongs_to :user
validates_uniqueness_of :film_id, scope: [:attitude_id,:user_id,:person_id]
end
