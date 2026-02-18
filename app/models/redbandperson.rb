class Redbandperson < ApplicationRecord
belongs_to :user
belongs_to :person
validates_uniqueness_of :user_id, scope: :person_id

end
