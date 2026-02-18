class Personhavelifestateshavephoto < ApplicationRecord
belongs_to :personhavelifestate
belongs_to :photo
validates_uniqueness_of :personhavelifestate_id, scope: :photo_id
end
