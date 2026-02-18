class Photoshavethingshaveowner < ApplicationRecord
belongs_to :person
belongs_to :photoshavething
validates_uniqueness_of :person_id, scope: :photoshavething_id
end
