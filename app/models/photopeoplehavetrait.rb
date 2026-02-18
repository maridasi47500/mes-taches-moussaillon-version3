class Photopeoplehavetrait < ApplicationRecord
belongs_to :trait
belongs_to :person
belongs_to :attitudephoto
validates_uniqueness_of :trait_id, scope: [:trait_id, :person_id, :attitudephoto_id]
end
