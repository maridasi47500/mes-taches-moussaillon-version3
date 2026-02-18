class Taskactionsailorjob < ApplicationRecord
  belongs_to :sailorjob
  belongs_to :taskaction
  #validates_uniqueness_of :sailorjob_id, scope: :taskaction_id
  has_many :taskhavetaskactiontwosailorjobs, foreign_key: 'taskactiontwosailorjob_id'
  has_many :people, through: :taskhavetaskactiontwosailorjobs
  def self.findpeople(a,b)
    find_by(taskaction:a,sailorjob_id: b)
  end
    def self.findbyobject(a)
    a ? find(a.id) : nil
  end

end
