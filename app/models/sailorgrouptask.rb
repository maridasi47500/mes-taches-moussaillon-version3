class Sailorgrouptask < ApplicationRecord
  belongs_to :grouptask
  belongs_to :person
  validates_uniqueness_of :grouptask_id, scope: :person_id
  has_many :thingssailorgrouptasks
  has_many :things, through: :thingssailorgrouptasks
  has_many :actionssailorgrouptasks
  has_many :taskactions, through: :actionssailorgrouptasks, autosave: true

end

