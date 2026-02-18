class Peoplehavelanguage < ApplicationRecord
belongs_to :language
belongs_to :person
validates_uniqueness_of :language_id,scope: :person_id
end
