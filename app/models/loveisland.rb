class Loveisland < ApplicationRecord
belongs_to :wantedcouple, class_name: 'Linkspouseperson'
belongs_to :notwantedcouple, class_name: 'Linkspouseperson'
validates_uniqueness_of :wantedcouple_id, scope: :notwantedcouple_id
end
