class Internetpseudonym < ApplicationRecord
belongs_to :surname
belongs_to :website
validates_uniqueness_of :surname_id, scope: :website_id
has_and_belongs_to_many :cities, :join_table => :internetpseudonymshavecities
end
