class Twosailorjob < ApplicationRecord
belongs_to :sailorjob
belongs_to :othersailorjob, class_name: 'Sailorjob', foreign_key: 'othersailorjob_id'
validates_uniqueness_of :sailorjob_id, scope: :othersailorjob_id
end
