class Attitudeshavesailor < ApplicationRecord
def pro?
self.is_a?(Attitudeshavesailor)
end
def amateur?
self.is_a?(Attitudehavefollower)
end
belongs_to :person
belongs_to :attitude
validates_uniqueness_of :person_id,scope: :attitude_id
has_many :simultaneoussilorattitudes, foreign_key: 'attitudeshavesailora_id'
has_many :othersailors, through: :simultaneoussilorattitudes, source: :attitudeshavesailorb

has_many :simultaneousprosailorattitudes, foreign_key: 'attitudeshavesailora_id'
has_many :otherfollowers, through: :simultaneousprosailorattitudes, source: :attitudehavefollowerb
end
