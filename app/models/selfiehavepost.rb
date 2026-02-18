class Selfiehavepost < ApplicationRecord
belongs_to :selfie
belongs_to :post
validates_uniqueness_of :selfie_id, scope: :post_id
end
