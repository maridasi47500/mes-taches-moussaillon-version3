class Thingssailorgrouptask < ApplicationRecord
  belongs_to :sailorgrouptask
  belongs_to :thing
  validates_uniqueness_of :sailorgrouptask_id, scope: :thing_id
end

