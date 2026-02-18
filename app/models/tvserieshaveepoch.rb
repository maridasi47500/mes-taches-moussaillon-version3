class Tvserieshaveepoch < ApplicationRecord
belongs_to :tvseries
belongs_to :epoch
validates_uniqueness_of :tvseries_id, scope: :epoch_id
end
