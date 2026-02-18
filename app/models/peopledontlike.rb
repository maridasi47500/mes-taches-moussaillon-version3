class Peopledontlike < ApplicationRecord
self.table_name = 'peopledontlike'
belongs_to :user
belongs_to :person
validates_uniqueness_of :user_id, scope: :person_id
after_validation :like
def like
Peoplelike.where(user: self.user, person: self.person).destroy_all
end
end

