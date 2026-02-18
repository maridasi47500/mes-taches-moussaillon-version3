class Scoreshavekey < ApplicationRecord
belongs_to :musicalscore
belongs_to :musicalkey
validates_uniqueness_of :musicalscore_id, scope: :musicalkey_id
end
