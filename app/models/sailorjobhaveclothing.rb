class Sailorjobhaveclothing < ApplicationRecord
  belongs_to :sailorjob
  belongs_to :clothing
  validates_uniqueness_of :sailorjob_id, scope: :clothing_id
end

