class Mysector < ApplicationRecord
belongs_to :usersjob
belongs_to :sector
validates_uniqueness_of :usersjob, scope: :sector_id
end
