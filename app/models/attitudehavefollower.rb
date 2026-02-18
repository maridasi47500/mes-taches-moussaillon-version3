class Attitudehavefollower < ApplicationRecord
def pro?
self.is_a?(Attitudeshavesailor)
end
def amateur?
self.is_a?(Attitudehavefollower)
end

belongs_to :attitude
belongs_to :person
validates_uniqueness_of :person_id,scope: :attitude_id
has_many :simultaneoussilorattitudes, foreign_key: 'attitudeshavesailorb_id'
has_many :othersailors, through: :simultaneoussilorattitudes, source: :attitudeshavesailora

has_many :simultaneousattitudes, foreign_key: 'attitudehavefollowera_id'
has_many :otherfollowers, through: :simultaneousattitudes, source: :attitudehavefollowerb

end
