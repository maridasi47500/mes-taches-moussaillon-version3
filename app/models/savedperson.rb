class Savedperson < ApplicationRecord
belongs_to :person
belongs_to :user
validates_uniqueness_of :person_id, scope: :user_id
end
