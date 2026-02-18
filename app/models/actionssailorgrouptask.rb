class Actionssailorgrouptask < ApplicationRecord
  belongs_to :sailorgrouptask
  belongs_to :taskaction
  validates_uniqueness_of :sailorgrouptask_id, scope: :taskaction_id
end
