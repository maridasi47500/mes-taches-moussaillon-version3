class Taskhavetaskactiontwosailorjob < ApplicationRecord
  belongs_to :taskactionsailorjob, foreign_key: 'taskactiontwosailorjob_id'
  belongs_to :person
has_one :sailorjob, through: :taskactionsailorjob
has_one :taskaction, through: :taskactionsailorjob
  validates_uniqueness_of :taskactiontwosailorjob_id, scope: :person_id
end
