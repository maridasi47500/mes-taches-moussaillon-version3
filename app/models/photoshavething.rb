class Photoshavething < ApplicationRecord
belongs_to :photo
belongs_to :thing
has_many :photoshavethingshaveowners
has_many :owners, :through => :photoshavethingshaveowners, class_name: "Person", source: :person
validates_uniqueness_of :photo_id, scope:[:thing_id]
def self.withcoord
where.not(tagx: [nil,0]).where.not(tagy: [nil,0])
end
def rectanglecoord

"#{self.tagx-30},#{self.tagy-30},#{self.tagx+30},#{self.tagy+30}"
end
end

