class Photohavesailor < ApplicationRecord
belongs_to :photo
belongs_to :person
belongs_to :emotion
validates_uniqueness_of :photo_id, scope:[:person_id,:emotion_id]
def self.withcoord
where.not(tagx: [nil,0],tagy: [nil,0])
end
def rectanglecoord

"#{self.tagx-30},#{self.tagy-30},#{self.tagx+30},#{self.tagy+30}"
end
end
