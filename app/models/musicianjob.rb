class Musicianjob < ApplicationRecord
belongs_to :musician, class_name: 'Person'
belongs_to :concert
validates_uniqueness_of :musician_id, scope: :concert_id
end
