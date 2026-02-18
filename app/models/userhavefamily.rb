class Userhavefamily < ApplicationRecord
belongs_to :user
belongs_to :familylink
belongs_to :person
validates_uniqueness_of :person_id, scope: [:familylink_id,:user_id]
end
