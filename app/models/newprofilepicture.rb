class Newprofilepicture < ApplicationRecord
belongs_to :profilepicture
belongs_to :person
validates_uniqueness_of :profilepicture_id, scope: :person_id
end
