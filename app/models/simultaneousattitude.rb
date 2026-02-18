class Simultaneousattitude < ApplicationRecord
belongs_to :attitudehavefollowera, class: 'Attitudehavefollower'
belongs_to :attitudehavefollowerb, class: 'Attitudehavefollower'
validates_uniqueness_of :attitudehavefollowera_id, scope: :attitudehavefollowerb_id
end
