class Twopeoplehavejob < ApplicationRecord
belongs_to :twoperson
belongs_to :job

validates_uniqueness_of :job_id, scope: :twoperson_id
end

