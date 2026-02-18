class Traumberuf < ApplicationRecord
belongs_to :job
belongs_to :person
validates_uniqueness_of :job_id, scope: :person_id
end
