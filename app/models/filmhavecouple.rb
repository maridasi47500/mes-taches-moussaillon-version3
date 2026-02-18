class Filmhavecouple < ApplicationRecord
belongs_to :phavefilm
belongs_to :otherphavefilm, class_name: 'Phavefilm'
validates_uniqueness_of :phavefilm_id, scope: :otherphavefilm_id

end
