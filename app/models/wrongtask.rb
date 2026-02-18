class Wrongtask < ApplicationRecord
belongs_to :wrongsailorjob, class_name: 'Sailorjob'
belongs_to :suggestedsailorjob, class_name: 'Sailorjob'
validates_uniqueness_of :wrongsailorjob_id, scope: :suggestedsailorjob_id
end
