class Filmhaveepoch < ApplicationRecord
belongs_to :film
belongs_to :epoch
validates_uniqueness_of :film_id, scope: :epoch_id
end
