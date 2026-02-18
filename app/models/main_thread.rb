class MainThread < ApplicationRecord
  has_and_belongs_to_many :posts
  has_and_belongs_to_many :tasks
  has_and_belongs_to_many :events
  #validates :validated, inclusion: [true]
  validates :created, presence: true
alias_attribute :plannedtime, :planned

  before_validation :ensure_created_has_a_value
  def self.ingoodorder
    order(planned: :desc)
  end
  def plannedtime=(time)
t=time.to_time
if time && t
self.planned+=t.hour.hours
self.planned+=t.min.minutes
self.planned+=t.sec.seconds
end
self.save
  end
  private
  def ensure_created_has_a_value
    if created.nil?
      self.created = DateTime.now
    end
  end
end