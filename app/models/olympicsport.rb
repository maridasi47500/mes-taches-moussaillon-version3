class Olympicsport < ApplicationRecord
belongs_to :sport
belongs_to :sport_group
validates_uniqueness_of :sport_id
end