class Radioshavecity < ApplicationRecord
belongs_to :radio
belongs_to :city
validates_uniqueness_of :city_id, scope: :radio_id
end
