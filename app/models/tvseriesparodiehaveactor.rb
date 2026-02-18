class Tvseriesparodiehaveactor < ApplicationRecord
belongs_to :tvseries,foreign_key:'film_id', class_name: 'Tvseriesparody',optional:true
belongs_to :surname,optional:true
accepts_nested_attributes_for :surname
belongs_to :person
has_many :tvseriesparodiehavecouples

validates_uniqueness_of :film_id, scope:[:surname_id, :person_id]

has_many :parodyepisodes
has_many :tvseriesparodiehaveactors, through: :parodyepisodes


end
