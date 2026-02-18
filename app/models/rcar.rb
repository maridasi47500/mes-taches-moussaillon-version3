class Rcar < ApplicationRecord
belongs_to :user
belongs_to :person
validates_uniqueness_of :user_id, scope: :person_id
after_validation :like
def like
Rrobot.where(user: self.user, person: self.person).destroy_all
end


end
