class Filmparodiehavecouple < ApplicationRecord
belongs_to :filmparodiehaveactor
belongs_to :otherfilmparodiehaveactor, class_name: 'Filmparodiehaveactor'
validates_uniqueness_of :filmparodiehaveactor_id, scope: :otherfilmparodiehaveactor_id

end
