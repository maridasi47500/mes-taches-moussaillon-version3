class Peoplehavestrength < ApplicationRecord
belongs_to :strength
belongs_to :person
belongs_to :linkspouseperson
belongs_to :user
validates_uniqueness_of :user_id, scope: [:strength_id, :person_id, :linkspouseperson_id]
end
