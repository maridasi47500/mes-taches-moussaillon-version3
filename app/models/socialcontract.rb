class Socialcontract < ApplicationRecord
belongs_to :person
belongs_to :otherperson, class_name: 'Person'
validates_uniqueness_of :person_id, scope: :otherperson_id
end
