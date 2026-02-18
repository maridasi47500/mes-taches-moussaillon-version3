class Personhavelifestate < ApplicationRecord
belongs_to :person
belongs_to :lifestate
validates_uniqueness_of :person_id, scope: :lifestate_id
has_and_belongs_to_many :photos, :join_table => :personhavelifestateshavephotos
has_and_belongs_to_many :requeststopeople, :join_table => :lifestateshaverequests

end
