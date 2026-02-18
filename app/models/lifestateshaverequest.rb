class Lifestateshaverequest < ApplicationRecord
belongs_to :requeststoperson
belongs_to :personhavelifestate
validates_uniqueness_of :requeststoperson_id, scope: :personhavelifestate_id
end
