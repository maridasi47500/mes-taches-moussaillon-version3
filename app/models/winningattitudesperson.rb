class Winningattitudesperson < ApplicationRecord
belongs_to :winningattitude
belongs_to :person
validates_uniqueness_of :winningattitude_id, scope: :person_id
end
