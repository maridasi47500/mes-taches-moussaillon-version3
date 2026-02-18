class Selfportrait < ApplicationRecord
belongs_to :sailor, class_name: "Person"
validates_uniqueness_of :sailor_id
belongs_to :hairlength, optional: true
belongs_to :hairtype, optional: true
belongs_to :haircolor, optional: true
belongs_to :bodydescription, optional: true
belongs_to :faceshape, optional: true
belongs_to :skin_type, optional: true
belongs_to :skin_color, optional: true
belongs_to :makeupstyle, optional: true
belongs_to :eyecolor, optional: true
belongs_to :clothescolor, optional: true
#photo de famille
#photo portrait (cheveux)
#photo de couple en jogging /sur la plage
end