class Peoplejobcity < ApplicationRecord
belongs_to :peoplehavejob
belongs_to :city
validates_uniqueness_of :peoplehavejob_id,scope: :city_id
end