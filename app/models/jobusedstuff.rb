class Jobusedstuff < ApplicationRecord
belongs_to :job
belongs_to :thing
belongs_to :user
validates_uniqueness_of :job_id, scope: [:thing_id,:user_id]

end
