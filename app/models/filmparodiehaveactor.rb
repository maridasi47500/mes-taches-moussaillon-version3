class Filmparodiehaveactor < ApplicationRecord
belongs_to :film,foreign_key:'film_id', class_name: 'Filmparody',optional:true
belongs_to :surname,optional:true
belongs_to :person
validates_uniqueness_of :person_id, scope:[:surname_id, :film_id]
has_many :filmparodiehavecouples

end

