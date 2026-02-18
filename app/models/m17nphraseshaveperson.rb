class M17nphraseshaveperson < ApplicationRecord
belongs_to :m17nphrase
belongs_to :person
validates_uniqueness_of :m17nphrase_id, scope: :person_id
end
