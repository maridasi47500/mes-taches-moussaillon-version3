class Skillhavesailor < ApplicationRecord
belongs_to :person
belongs_to :skill
validates_uniqueness_of :person_id, scope: :skill_id
end
