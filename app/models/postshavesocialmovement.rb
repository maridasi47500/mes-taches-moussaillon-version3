class Postshavesocialmovement < ApplicationRecord
belongs_to :post
belongs_to :socialmovement
validates_uniqueness_of :post_id, scope: :socialmovement_id
end
