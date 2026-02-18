class Myothertaskhavetaskactiontwosailorjob < ApplicationRecord
  belongs_to :taskhavetaskactiontwosailorjob
  belongs_to :othertask, foreign_key: 'ifothertaskhavetaskactiontwosailorjob_id', class_name: 'Taskhavetaskactiontwosailorjob'
  validates_uniqueness_of :taskhavetaskactiontwosailorjob_id, scope: :ifothertaskhavetaskactiontwosailorjob_id
end
