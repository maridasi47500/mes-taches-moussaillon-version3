class Conditionnotneglectedtask < ApplicationRecord
    belongs_to :welldonesailorjob, class_name: 'Sailorjob'
    belongs_to :neglectedsailorjob, class_name: 'Sailorjob'
    validates_uniqueness_of :welldonesailorjob_id, scope: :neglectedsailorjob_id

end
