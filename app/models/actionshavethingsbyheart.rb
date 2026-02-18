class Actionshavethingsbyheart < ApplicationRecord
belongs_to :taskaction
belongs_to :categorything
validates_uniqueness_of :taskaction_id, scope: :categorything_id
end
