class PeoplePlace < ApplicationRecord
belongs_to :person
belongs_to :place
validates_uniqueness_of :person_id, scope: :city_id

end
