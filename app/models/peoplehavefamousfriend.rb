class Peoplehavefamousfriend < ApplicationRecord
belongs_to :person
belongs_to :friend, class_name: 'Person'
validates_uniqueness_of :person_id, scope: :friend_id
end