class Peoplecitiesepoch < ApplicationRecord
belongs_to :people_city
belongs_to :epoch
validates_uniqueness_of :people_city_id, scope: :epoch_id

end
