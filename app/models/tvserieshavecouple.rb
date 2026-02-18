class Tvserieshavecouple < ApplicationRecord
belongs_to :tvserieshaveactor
belongs_to :othertvserieshaveactor, class_name: 'Tvserieshaveactor'
validates_uniqueness_of :tvserieshaveactor_id, scope: :othertvserieshaveactor_id

end
